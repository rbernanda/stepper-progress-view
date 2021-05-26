import 'package:flutter/material.dart';
import 'package:progress_stepper/Screens/password_form.dart';
import 'package:progress_stepper/components/Button.dart';
import 'package:progress_stepper/components/body.dart';
import 'package:progress_stepper/components/input_field.dart';
import 'package:progress_stepper/components/step_progress.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final int _curPage = 1;
  Size _safeAreaSize;

  @override
  Widget build(BuildContext context) {
    var mediaQD = MediaQuery.of(context);
    _safeAreaSize = mediaQD.size;
    return Scaffold(
      body: Body(children: <Widget> [
        Container(height: 150.0, child: StepProgress(_curPage, _safeAreaSize.width)),
        InputField(hintText: "Email", icon: Icons.email_outlined, onChanged: (value) {}),
        Button(press: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PasswordForm();
          }));
        }, text: "Next")
      ])
    );
  }
}