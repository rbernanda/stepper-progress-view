import 'package:flutter/material.dart';
import 'package:progress_stepper/components/Button.dart';
import 'package:progress_stepper/components/body.dart';
import 'package:progress_stepper/components/input_field.dart';
import 'package:progress_stepper/constants.dart';

class PasswordForm extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: kPrimaryColor,
      body: Body(children: <Widget> [
        InputField(hintText: "Password" , onChanged: (value) {}, secure: true, suffix: true,),
        Button(press: () {
          // Navigator.pop(context);
        }, text: "Next")
      ])
    );
  }
}