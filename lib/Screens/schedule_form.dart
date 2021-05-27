import 'package:flutter/material.dart';
import 'package:progress_stepper/components/Button.dart';
import 'package:progress_stepper/components/body.dart';
import 'package:progress_stepper/components/option_input.dart';
import 'package:progress_stepper/components/step_progress.dart';
import 'package:progress_stepper/constants.dart';

class ScheduleForm extends StatefulWidget {
  @override
  _ScheduleFormState createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<ScheduleForm> {
  Size _safeAreaSize;
  final int _curPage = 4;

  @override
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
              // _mainSection()
            ]));
  }
}