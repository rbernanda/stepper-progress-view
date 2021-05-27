import 'package:flutter/material.dart';
import 'package:progress_stepper/Screens/password_form.dart';
import 'package:progress_stepper/components/Button.dart';
import 'package:progress_stepper/components/body.dart';
import 'package:progress_stepper/components/form_field_container.dart';
import 'package:progress_stepper/components/step_progress.dart';
import 'package:progress_stepper/constants.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final int _curPage = 1;
  final _emailTextController = TextEditingController();
  Size _safeAreaSize;
  String email;
  bool _validate = false;

  bool _validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      setState(() {
        _validate = true;
      });
      return true;
    } else {
      return false;
    }
  }

  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

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
              FormFieldContainer(
                  child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: kInputFieldColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: TextField(
                  controller: _emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18),
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      errorText: _validate ? 'Enter Valid Email' : null,
                      icon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      )),
                ),
              )),
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
                            if (!_validateEmail(email)) {
                              setState(() {
                                _validate = false;
                              });
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PasswordForm();
                              }));
                            }
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
