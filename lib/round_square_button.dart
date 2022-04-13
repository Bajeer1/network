import 'package:flutter/material.dart';

class RoundSquareButton extends StatelessWidget {
  RoundSquareButton({required this.horizontal_gap, required this.text, required this.action});

  late final double horizontal_gap;
  late final String text;
  late final Function action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal_gap),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(Colors.lightBlue.shade600),
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(vertical: 12)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)))),
        onPressed: () {action;},
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
