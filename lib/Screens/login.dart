import 'package:flutter/material.dart';
import 'package:network_app/custom_icons.dart';

import 'dart:ui';
import 'package:network_app/round_square_button.dart';
import 'package:flutter/services.dart';
import 'package:network_app/Screens/registration.dart';
import 'package:network_app/methods.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final String email;
  late final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/34423.jpg"),
              fit: BoxFit.cover,
              opacity: 0.3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            CircleAvatar(
              radius: 38,
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                'YourHistropedia',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: TextField(
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      KTextFieldDecoration.copyWith(hintText: 'email address')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 45),
              child: TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value;
                  },
                  decoration:
                      KTextFieldDecoration.copyWith(hintText: 'password')),
            ),
            SizedBox(height: 5),
            RoundSquareButton(
                horizontal_gap: 135,
                text: 'Log in',
                action: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
            SizedBox(height: 14),
            buildSeperator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have a account?',
                  style: TextStyle(fontSize: 11),
                ),
                SizedBox(
                  height: 37,
                  width: 54,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                    child: Text(
                      'Join us',
                      style: TextStyle(color: Colors.blue, fontSize: 11),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
