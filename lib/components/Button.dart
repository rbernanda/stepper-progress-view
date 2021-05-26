import 'package:flutter/material.dart';
import 'package:progress_stepper/constants.dart';

class Button extends StatelessWidget {
  final Function press;
  final String text;
  final Color color, textColor;
  const Button({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      color: color,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: TextButton(onPressed: press, child: Text(
        text,
        style: TextStyle(color: textColor),
      )),
    );
  }
}