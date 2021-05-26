import 'package:flutter/material.dart';
import 'package:progress_stepper/Screens/password_form.dart';
import 'package:progress_stepper/components/Button.dart';
import 'package:progress_stepper/components/body.dart';
import 'package:progress_stepper/components/input_field.dart';
import 'package:progress_stepper/components/step_progress.dart';
import 'package:progress_stepper/constants.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final int _curPage = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Size _safeAreaSize;
  String email;

  Widget _getHeroSection() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
                text: TextSpan(
                  text: 'Welcome to\nGIN ',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                      color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Finans',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 36,
                            color: Colors.blue,
                            height: 1.5)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to The Bank of The Future.\nManage and track your accounts on\nthe go.',
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5,
                    fontSize: 18),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: InputField(
                    hintText: "Email",
                    onChanged: (String value) {
                      setState(() {
                        email = value;
                      });
                    }),
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    var mediaQD = MediaQuery.of(context);
    _safeAreaSize = mediaQD.size;
    return Scaffold(
        backgroundColor: Color(0xFF0278ae),
        body: Body(children: <Widget>[
          Container(
              height: 150.0,
              child: StepProgress(_curPage, _safeAreaSize.width)),
          Container(
            height: mediaQD.size.height - 150.0,
            width: mediaQD.size.width,
            decoration: BoxDecoration(
              color: kInputFieldColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _getHeroSection(),
                Container(
                  height: 200,
                  width: mediaQD.size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button(
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PasswordForm();
                      }));
                    },
                    text: "Next")
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
