import 'package:flutter/material.dart';
import 'package:network_app/custom_icons.dart';
import 'Screens/registration.dart';

const KTextFieldDecoration = InputDecoration(
  isDense: true,
  hintText: 'username',
  hintStyle: TextStyle(color: Colors.black38),
  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none),
);

class Icon_Button extends StatelessWidget {

  Icon_Button(this.logo, this.color);

  late final IconData logo;
  late final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      color: color,
      onPressed: () {},
      icon: Icon(logo),
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Divider(
          thickness: 0.6,
          color: Colors.black26,
        ),
      ),
    );
  }
}

Container buildSeperator() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50),
    child: Row(
      children: [
        DividerLine(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(CustomIcons.atom, color: Colors.lightBlue,),
        ),
        DividerLine(),
      ],
    ),
  );
}




