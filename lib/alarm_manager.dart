import 'package:flutter/material.dart';

class AlarmManager extends StatefulWidget {
  const AlarmManager({Key? key, required this.description}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String description;

  @override
  State<AlarmManager> createState() => _AlarmManagerState();
}

class _AlarmManagerState extends State<AlarmManager> {
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
    return Card(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.access_alarms,
                  size: 48.0,
                  color: Colors.green.shade400,
                ),
                title: Text.rich(
                  TextSpan(children: <TextSpan>[
                    const TextSpan(
                      text: "Next Alarm: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    TextSpan(
                        text: widget.description,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.grey)),
                  ]),
                ),
                // title: const Text(
                //   'Next Alarm:',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ), // bigger and bold
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      child: const Text('CANCEL'),
                      onPressed: () {/* ... */},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
