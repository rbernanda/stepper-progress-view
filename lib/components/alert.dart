import 'package:flutter/material.dart';

// class PersonDetailsDialog extends StatefulWidget {

//   PersonDetailsDialog({Key key}) : super(key: key);

//   @override
//   _PersonDetailsDialogState createState() {
//     return _PersonDetailsDialogState();
//   }
// }

class Alert extends StatelessWidget {
  final String title;
  final String content;
  const Alert({Key key, this.title = "title", this.content = "content"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(content),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
