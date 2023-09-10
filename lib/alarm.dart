import 'package:flutter/material.dart';

import 'alarm_form.dart';
import 'alarm_manager.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // two widgets here one for CurrentAlarm and second for AlarmForm
        AlarmManager(description: "You have not set an alarm yet!"),
        SizedBox(
          height: 20,
        ),
        AlarmForm(),
      ],
    );
  }
}
