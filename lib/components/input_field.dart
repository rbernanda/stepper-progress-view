import 'package:flutter/material.dart';
import 'package:progress_stepper/components/form_field_container.dart';
import 'package:progress_stepper/constants.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const InputField({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
     return FormFieldContainer(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kInputFieldColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: TextFormField(
        style: TextStyle(
          fontSize: 18
        ),
        onChanged: onChanged,
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        decoration: InputDecoration(
          icon: Icon(
            Icons.email_outlined,
            color: Colors.black,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
      )
    );
  }
}