import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //user sign up data
  Future<String> signUpUser({
    required String email,
    required String password,
    String? username,
    required String firstName,
    required String lastName,
    String? about,
    /*required Uint8List file*/
  }) async {
    String result = 'some error';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential user_info = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await _firestore.collection('users').doc(user_info.user!.uid).set({
          "username": username,
          "email": email,
          "firstName": firstName,
          "lastName": lastName,
          "about": about,
        });
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}
