import 'package:flutter/material.dart';
import 'package:light_alarm/alarm.dart';
import 'package:light_alarm/jounral.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Alarm Journal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [const Alarm(), const Journal()];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.green.shade400, fontSize: 30),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: screens[currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade900,
        selectedItemColor: Colors.green[400],
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
            ),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notes,
            ),
            label: 'Journal',
          ),
        ],
        unselectedItemColor: Colors.white54,
        unselectedFontSize: 14,
        selectedFontSize: 16,
      ),
      backgroundColor: Colors.grey.shade800,
    );
  }
}
