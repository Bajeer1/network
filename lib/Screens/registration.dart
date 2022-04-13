import 'dart:io';
import 'dart:math';
import 'package:network_app/Authentication//auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:network_app/custom_icons.dart';
import 'package:network_app/methods.dart';
import 'package:network_app/round_square_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static String id = 'registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController firstNameControllor = TextEditingController();
  TextEditingController lastNameControllor = TextEditingController();
  TextEditingController passwordControllor = TextEditingController();
  TextEditingController emailControllor = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: SizedBox(
                  height: 100,
                ),
              ),
              Center(
                child: Text(
                  'YourHistropedia',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Center(
                child: Text(
                  'Leave your legacy!',
                  style: TextStyle(color: Colors.black, fontSize: 12.5),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                          controller: firstNameControllor,
                          decoration: KTextFieldDecoration.copyWith(
                              hintText: 'First Name')),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                          controller: lastNameControllor,
                          decoration: KTextFieldDecoration.copyWith(
                              hintText: 'Last Name')),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: dateinput,
                        decoration: KTextFieldDecoration.copyWith(
                            hintText: 'date of birth'),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 45,
                      child: ElevatedButton(
                        onPressed: () async {
                          {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                dateinput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(vertical: 6.5)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)))),
                        child: Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black45,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                    controller: emailControllor,
                    decoration:
                        KTextFieldDecoration.copyWith(hintText: 'email address')),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: TextField(
                    obscureText: true,
                    controller: passwordControllor,
                    decoration:
                        KTextFieldDecoration.copyWith(hintText: 'password')),
              ),
              SizedBox(
                height: 35,
              ),
              RoundSquareButton(
                horizontal_gap: 45,
                text: 'Create my account',
                action: () async {
                  AuthMethods().signUpUser(
                    email: passwordControllor.text,
                    password: passwordControllor.text,
                    username: emailControllor.text,
                    firstName: firstNameControllor.text,
                    lastName: lastNameControllor.text
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: buildSeperator(),
              ),
              Center(
                child: Text(
                  'Sign up with',
                  style: TextStyle(fontSize: 9),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon_Button(CustomIcons.instagram, Colors.pink),
                    Icon_Button(CustomIcons.google, Colors.black54),
                    Icon_Button(CustomIcons.twitter, Colors.lightBlue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
