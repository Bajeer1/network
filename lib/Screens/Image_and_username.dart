import 'package:flutter/material.dart';

class DpAndUsername extends StatefulWidget {
  const DpAndUsername({Key? key}) : super(key: key);

  static String id = 'Image_and_username';

  @override
  State<DpAndUsername> createState() => _DpAndUsernameState();
}

class _DpAndUsernameState extends State<DpAndUsername> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: (){},
                child: CircleAvatar(
            radius: 55,
          ),
              )),
        ],
      ),
    );
  }
}
