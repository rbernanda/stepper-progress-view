import 'package:flutter/material.dart';
import 'package:progress_stepper/components/form_field_container.dart';

class OptionInput extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final chosenValue;
  final label;
  final List<String> items;
  const OptionInput(
      {Key key, this.hintText, this.onChanged, this.chosenValue, this.label, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormFieldContainer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text("$label",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            value: chosenValue,
            icon: Icon(Icons.arrow_drop_down_outlined),
            hint: Text(
              "$hintText",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          )),
        )
      ],
    ));
  }
}
