import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/Reminder_ui/homepage/homepage.dart';
import 'package:provider/provider.dart';

import '../global_bloc.dart';

class MedicineReminder extends StatefulWidget {
  @override
  _MedicineReminderState createState() => _MedicineReminderState();
}

class _MedicineReminderState extends State<MedicineReminder> {
  GlobalBloc globalBloc;

  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
        ),
        home: HomePageReminder(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
