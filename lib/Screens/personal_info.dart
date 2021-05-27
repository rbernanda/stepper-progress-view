import 'package:flutter/material.dart';
import 'package:progress_stepper/Screens/schedule_form.dart';
import 'package:progress_stepper/components/Button.dart';
import 'package:progress_stepper/components/body.dart';
import 'package:progress_stepper/components/option_input.dart';
import 'package:progress_stepper/components/step_progress.dart';
import 'package:progress_stepper/constants.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final int _curPage = 3;
  Size _safeAreaSize;
  String chosenGoal;
  String chosenMonthlyIncome;
  String chosenMonthlyExpense;

  List<String> _goal = ['Emergencies', 'Comfortable Retirement', 'Kids College Education', 'Buying a House'];
  List<String> _income = ['Rp 1.000.000+', 'Rp 2.000.000+', 'Rp 4.000.000+', 'Rp 6.000.000+'];
  List<String> _expense = ['Rp 500.000+', 'Rp 1.000.000+', 'Rp 2.000.000+', 'Rp 5.000.000+'];

  bool _auth() {
    return 
    (chosenGoal.isNotEmpty && chosenGoal != null) &&
    (chosenMonthlyIncome.isNotEmpty && chosenMonthlyIncome != null) &&
    (chosenMonthlyExpense.isNotEmpty && chosenMonthlyExpense != null);
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
                  'Personal Information',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Please fill in the information below and your goal for digital saving.',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                OptionInput(
                  hintText: "- Choose Option -",
                  onChanged: (String value) {
                    setState(() {
                      chosenGoal = value;
                    });
                  },
                  chosenValue: chosenGoal,
                  label: "Goal for activation",
                  items: _goal,
                ),
                SizedBox(
                  height: 10,
                ),
                OptionInput(
                  hintText: "- Choose Option -",
                  onChanged: (String value) {
                    setState(() {
                      chosenMonthlyIncome = value;
                    });
                  },
                  chosenValue: chosenMonthlyIncome,
                  label: "Monthly income",
                  items: _income
                ),
                SizedBox(
                  height: 10,
                ),
                OptionInput(
                  hintText: "- Choose Option -",
                  onChanged: (String value) {
                    setState(() {
                      chosenMonthlyExpense = value;
                    });
                  },
                  chosenValue: chosenMonthlyExpense,
                  label: "Monthly expense",
                  items: _expense
                )
              ],
            ),
          ),
          Button(
              color: Colors.white.withOpacity(0.2),
              press: () {
                if (_auth()) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScheduleForm();
                  }));
                }
              },
              text: "Next"),
        ],
      ),
    );
  }

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
              _mainSection()
            ]));
  }
}
