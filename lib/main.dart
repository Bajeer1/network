import 'package:flutter/material.dart';
import 'Screens/login.dart';
import 'Screens/registration.dart';
import 'Screens/Image_and_username.dart';

void main() {
  runApp(network());
}

class network extends StatelessWidget {
  const network({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DpAndUsername.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        DpAndUsername.id: (context) => DpAndUsername(),
      },
    );
  }
}
