import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/screens/screen2.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
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
