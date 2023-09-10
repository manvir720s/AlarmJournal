import 'package:flutter/material.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 250, left: 16, right: 16),
      child: Card(
        color: Colors.black12,
        child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Day of Week',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 24),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Times Snoozed Pressed',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 24),
                    ),
                  ],
                ),
              ),
              const Divider(), // Add a divider between headers and content]
              ...List.generate(daysOfWeek.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        daysOfWeek[index],
                        style:
                            const TextStyle(color: Colors.green, fontSize: 24),
                      ),
                      const SizedBox(width: 10.0),
                      const Text(
                        '0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 24),
                      ),
                    ],
                  ),
                );
              }),
            ]),
      ),
    );
  }
}
