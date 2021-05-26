import 'package:flutter/material.dart';
import 'package:progress_stepper/constants.dart';

class FormFieldContainer extends StatelessWidget {
  final Widget child;
  const FormFieldContainer({
    Key key,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: kInputFieldColor,
      ),
      child: child,
    );
  }
}