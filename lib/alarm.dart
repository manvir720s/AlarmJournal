import 'package:flutter/material.dart';
import 'alarm_form.dart';
import 'alarm_manager.dart';

// Main widget for the Alarm screen.
class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    // The main layout of the Alarm screen is a Column widget.
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Display an AlarmManager widget with a description.
        // This widget shows information about any existing alarms.
        AlarmManager(description: "You have not set an alarm yet!"),

        // Add some spacing below the AlarmManager widget.
        SizedBox(height: 20),

        // Display an AlarmForm widget.
        // This widget is used to create or edit alarms.
        AlarmForm(),
      ],
    );
  }
}
