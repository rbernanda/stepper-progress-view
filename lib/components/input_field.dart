import 'package:flutter/material.dart';
import 'package:progress_stepper/components/form_field_container.dart';
import 'package:progress_stepper/constants.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool suffix;
  final ValueChanged<String> onChanged;
  final secure;
  const InputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.secure = false,
    this.suffix = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return FormFieldContainer(
      child: TextField(
        obscureText: secure,
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          suffixIcon: suffix ? Icon(
            Icons.visibility_outlined,
            color: kPrimaryColor,
          ) : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}