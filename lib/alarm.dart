import 'package:flutter/material.dart';

import 'alarm_form.dart';
import 'alarm_manager.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key, required this.counter}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String counter;

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // two widgets here one for CurrentAlarm and second for AlarmForm
        const AlarmManager(
            description:
                "You have the button this many times and more lines to test padding: "),
        const SizedBox(
          height: 20,
        ),
        AlarmForm(counter: widget.counter),
      ],
    );
  }
}
