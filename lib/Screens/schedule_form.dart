import 'package:flutter/material.dart';
import 'package:progress_stepper/components/Button.dart';
import 'package:progress_stepper/components/body.dart';
import 'package:progress_stepper/components/form_field_container.dart';
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
  DateTime _chosenDate = DateTime.now();
  TimeOfDay _chosenTime = TimeOfDay.now();
  TextEditingController _chosenDateTextController = TextEditingController();
  TextEditingController _chosenTimeTextController = TextEditingController();

  bool _auth() {
    return true;
    // (_chosenDate.isNotEmpty && _chosenDate != null) &&
    // (_chosenTime.isNotEmpty && _chosenTime != null);
  }

  String _getFormattedDate(date) {
    var days = [
      "",
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jumat",
      "Sabtu",
      "Minggu"
    ];
    var months = [
      "",
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "Mei",
      "Jun",
      "Jul",
      "Agust",
      "Sept",
      "Nov",
      "Des"
    ];
    var dates = date.day > 9 ? date.day : '0' + date.day;
    var year = date.year;
    return '${days[date.weekday]}, $dates ${months[date.month]} $year';
  }

  Future<Null> _selectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _chosenDate,
        firstDate: _chosenDate.subtract(Duration(days: 30)),
        lastDate: DateTime(_chosenDate.year + 1));
    if (picked != null && picked != _chosenDate) {
      setState(() {
        _chosenDate = picked;
        _chosenDateTextController.text = _getFormattedDate(picked);
      });
    }
  }

  Future<Null> _selectedTime(BuildContext context) async {
    final TimeOfDay pickedTime = await showTimePicker(
        context: context,
        initialTime: _chosenTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        });

    if (pickedTime != null && pickedTime != _chosenTime)
      setState(() {
        _chosenTime = pickedTime;
        var hour = pickedTime.hour;
        var minutes = pickedTime.minute;
        _chosenTimeTextController.text = '$hour:$minutes';
      });
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
                  'Schedule Video Call',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Choose the date and time that you preferred. we will send a link via email to make a video call on the scheduled date and time.',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                FormFieldContainer(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text("Date",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () => _selectedDate(context),
                        child: TextField(
                            controller: _chosenDateTextController,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            onChanged: (String value) {},
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                isDense: true,
                                hintText: "- Choose Date -",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                border: InputBorder.none,
                                enabled: false,
                                suffixIcon: Icon(Icons.arrow_drop_down_sharp))),
                      ),
                    )
                  ],
                )),
                SizedBox(height: 10),
                FormFieldContainer(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text("Time",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () => _selectedTime(context),
                        child: TextField(
                            controller: _chosenTimeTextController,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            onChanged: (String value) {},
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              isDense: true,
                                hintText: "- Choose Time -",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                border: InputBorder.none,
                                enabled: false,
                                suffixIcon: Icon(Icons.arrow_drop_down_sharp))),
                      ),
                    )
                  ],
                )),
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
