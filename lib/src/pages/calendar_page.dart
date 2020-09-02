import 'package:flutter/material.dart';

import '../screens/screen2.dart';

class CalendarPage extends StatelessWidget {
  static const String id = 'calender';
  final Function onNext;

  CalendarPage({this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: FlatButton(
          // onPressed: onNext,  //this function is used if want to remove the bottom navigation bar and to override it,and display the screen in a full page
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen2()));
          },
          child: Text('Go to next screen'),
          color: Colors.white,
        ),
      ),
    );
  }
}
