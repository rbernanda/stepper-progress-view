import 'package:flutter/material.dart';
import 'package:progress_stepper/components/form_field_container.dart';
import 'package:progress_stepper/constants.dart';

class PasswordField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final secure;
  final onPressedIcon;
  final icon;
  const PasswordField({
    Key key,
    this.hintText,
    this.onChanged,
    this.secure = false,
    this.onPressedIcon,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return FormFieldContainer(
      child: TextFormField(
        style: TextStyle(
          fontSize: 18
        ),
        obscureText: secure,
        onChanged: onChanged,
        cursorColor: Colors.black,
        keyboardType: TextInputType.visiblePassword,
        // validator: validateEmail,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: IconButton(
            icon: icon,
            color: kPrimaryColor,
            onPressed: onPressedIcon,
          ),
          border: InputBorder.none,
        ),
      )
    );
  }
}