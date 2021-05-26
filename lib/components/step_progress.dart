import 'package:flutter/material.dart';
import 'package:progress_stepper/constants.dart';

class StepProgress extends StatelessWidget {
  final int _curStep;
  final double width;
  final double height;
  final BoxDecoration decoration;
  final int steps;
  final Color done;
  final Color ongoing;
  final EdgeInsets padding;
  final double lineHeight;

  const StepProgress(
    int curStep,
    double width,
    {
    Key key,
    this.height = 150.0,
    this.steps = 4,
    this.done = Colors.green,
    this.ongoing = Colors.white,
    this.decoration = kStepperContainerColor,
    this.padding = kStepperPadding,
    this.lineHeight = 4.0,
  })  : 
        _curStep = curStep,
        width = width,
        assert(curStep > 0 == true && curStep <= steps),
        assert(width > 0),
        super(key: key);

  List<Widget> _buildStepper() {
    var wids = <Widget>[];
    for (int i = 0; i < steps; i++) {
      var circleColor =
          (_curStep > i + 1) ? done : ongoing;

      wids.add(Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black)),
        child: Center(
          child: Text((i + 1).toString(),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.black87, fontSize: 24)),
        ),
      ));

      //add a line separator
      if (i != steps - 1) {
        wids.add(Expanded(
            child: Container(
          height: lineHeight,
          color: Colors.black,
        )));
      }
    }

    return wids;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        height: this.height,
        width: this.width,
        decoration: this.decoration,
        child: Center(
          child: Row(
            children: _buildStepper(),
          ),
        ));
  }
}