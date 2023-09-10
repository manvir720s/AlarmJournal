import 'package:flutter/material.dart';
import 'package:light_alarm/alarm.dart';
import 'package:light_alarm/journal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The main entry point of the application.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // Set the home page of the app to MyHomePage.
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
  // Keep track of the currently selected tab index.
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Create a list of screens to display in the app.
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
          // Display the selected screen based on the currentIndex.
          child: screens[currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade900,
        selectedItemColor: Colors.green[400],
        currentIndex: currentIndex,
        // Update the currentIndex when a tab is tapped.
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
