import 'package:flutter/material.dart';
import 'package:progress_stepper/Screens/email_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text("Account Created", style: TextStyle(fontSize: 32)),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return EmailForm();
                  }));
            }, child: Text("Register"))
          ],
        )
      ),
    );
  }
}