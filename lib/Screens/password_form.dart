import 'package:flutter/material.dart';
import 'package:progress_stepper/components/Button.dart';
import 'package:progress_stepper/components/body.dart';
import 'package:progress_stepper/components/password_field.dart';
import 'package:progress_stepper/components/step_progress.dart';
import 'package:progress_stepper/constants.dart';

class PasswordForm extends StatefulWidget {
  @override
  PasswordFormState createState() => PasswordFormState();
}

class PasswordFormState extends State<PasswordForm> {
  final int _curPage = 2;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _required = ["Lowercase", "Uppercase", "Number", "Characters"];
  final _requiredSymbol = ["a", "A", "123", "9+"];
  Size _safeAreaSize;
  String _password = "";
  bool _secure = true;
  Widget icon = Icon(Icons.visibility_outlined);
  String complexity = "";

  void _toggle() {
    setState(() {
      _secure = !_secure;
      icon = _secure
          ? Icon(Icons.visibility_outlined)
          : Icon(Icons.visibility_off_outlined);
    });
  }

  // live validation
  bool _validatePassword(String password, String requiredChar,
      [int minLength = 9]) {
    switch (requiredChar) {
      case "a":
        bool hasLowercase = password.contains(RegExp(r'[a-z]'));
        return hasLowercase;
      case "A":
        bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
        return hasUppercase;
      case "123":
        bool hasDigits = password.contains(RegExp(r'[0-9]'));
        return hasDigits;
      case "9+":
        bool hasMinLength = password.length > minLength;
        return hasMinLength;
      default:
        return false;
    }
  }

  bool _auth() {
    bool hasLowercase = _password.contains(RegExp(r'[a-z]'));
    bool hasUppercase = _password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = _password.contains(RegExp(r'[0-9]'));
    bool hasMinLength = _password.length > 9;
    return hasLowercase && hasUppercase && hasDigits && hasMinLength;
  }

  void _generateComplexity(password) {
    bool hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool passwordCompliant = _auth();
    setState(() {
       complexity = (passwordCompliant && hasSpecialCharacters) ? "Strong" : passwordCompliant ? "Very Weak" : "";
    });
  }

  List<Widget> _buildRequiredCharacter(String password) {
    var wids = <Widget>[];
    _requiredSymbol.asMap().forEach((i, text) {
      var contains = _validatePassword(password, text);
      if (!contains) {
        wids.add(Container(
          width: 50,
          height: 50,
          child: Center(
            child: Text((text),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white, fontSize: 28)),
          ),
        ));
      } else {
        wids.add(Container(
          width: 40,
          height: 40,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          child: Center(
              child: Icon(
            Icons.check,
            color: Colors.white,
            size: 30.0,
          )),
        ));
      }
    });

    return wids;
  }

  List<Widget> _buildText() {
    var wids = <Widget>[];
    _required.asMap().forEach((i, text) {
      wids.add(Text(
        text,
        style: TextStyle(fontSize: 14, color: Colors.white70),
      ));
    });

    return wids;
  }

  Widget _mainSection() {
    var height = AppBar().preferredSize.height;
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height - height - 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Create Password',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Password will be used to login to account',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: PasswordField(
                      hintText: "Create Password",
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                          _generateComplexity(value);
                        });
                      },
                      secure: _secure,
                      onPressedIcon: _toggle,
                      icon: icon),
                ),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  text: TextSpan(
                    text: 'Complexity:     ',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                    children: <TextSpan>[
                      TextSpan(
                          text: "$complexity",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.orangeAccent,
                              height: 1.5)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _buildRequiredCharacter("$_password")),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildText(),
                ),
              ],
            ),
          ),
          SizedBox(height: 1),
          Button(
              color: Colors.green,
              press: () {
                if (_auth()) {
                  Navigator.pop(context);
                }
              },
              text: "Next"),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    var height = AppBar().preferredSize.height;
    var mediaQD = MediaQuery.of(context);
    _safeAreaSize = mediaQD.size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Account"),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: kPrimaryColor,
        body: Body(
            height: MediaQuery.of(context).size.height - height,
            children: <Widget>[
              Container(
                  height: 150.0,
                  child: StepProgress(_curPage, _safeAreaSize.width)),
              _mainSection()
            ]));
  }
}
