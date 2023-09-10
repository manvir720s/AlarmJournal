import 'package:flutter/material.dart';

class AlarmManager extends StatefulWidget {
  const AlarmManager({Key? key, required this.description}) : super(key: key);
  final String description;

  @override
  State<AlarmManager> createState() => _AlarmManagerState();
}

class _AlarmManagerState extends State<AlarmManager> {
  @override
  Widget build(BuildContext context) {
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
