import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/screens/bottomnav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBottomBarNavigator(),
    );
  }
}
