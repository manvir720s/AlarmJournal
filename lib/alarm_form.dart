import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:audioplayers/audioplayers.dart';

class AlarmForm extends StatefulWidget {
  const AlarmForm({Key? key}) : super(key: key);

  @override
  State<AlarmForm> createState() => _AlarmFormState();
}

class _AlarmFormState extends State<AlarmForm> {
  // Define days of the week as a map with initial values as false.
  var days = {
    "Monday": false,
    "Tuesday": false,
    "Wednesday": false,
    "Thursday": false,
    "Friday": false,
    "Saturday": false,
    "Sunday": false,
  };
  bool enableFlash = false;

  TextEditingController timeinput = TextEditingController();

  @override
  void initState() {
    // Initialize the text field with a default value.
    timeinput.text = "HH:MM:SS";
    super.initState();
  }

  void _handleSetAlarm() async {
    // Show a time picker dialog to set the alarm time.
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

      setState(() {
        timeinput.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      child: SizedBox(
        child: Column(
          children: <Widget>[
            const ListTile(
              title: Center(
                child: Text(
                  "Set Alarm",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                height: 75,
                child: TextField(
                  controller: timeinput,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.alarm,
                      color: Colors.grey,
                    ),
                    labelText: "Enter Time",
                    fillColor: Colors.green,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  readOnly: true,
                  onTap: _handleSetAlarm,
                  style: TextStyle(color: Colors.green.shade400),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Select Days to Repeat:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: days.keys.map((item) {
                  return box(item, days[item], Colors.deepPurpleAccent);
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.flashlight_on,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Enable Flash:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Switch.adaptive(
                    activeColor: Colors.green,
                    activeTrackColor: Colors.cyan,
                    inactiveThumbColor: Colors.blueGrey.shade600,
                    inactiveTrackColor: Colors.grey.shade400,
                    splashRadius: 50.0,
                    value: enableFlash,
                    onChanged: (value) =>
                        setState(() => enableFlash = (!enableFlash)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Column(
                        children: [
                          Icon(
                            Icons.volume_up,
                            color: Colors.grey,
                          ),
                          Text(
                            "Select Sound:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                final player = AudioCache();
                                player.play('iPhone Rader.mp3');
                              },
                              child: const Icon(Icons.music_note_rounded)),
                          const SizedBox(width: 5),
                          const Text(
                            "iPhone Radar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    child: const Text('SET'),
                    onPressed: () {
                      setState(() {
                        timeinput.text = 's';
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
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
    );
  }

  Widget box(
      String title, bool? isChecked, MaterialAccentColor deepPurpleAccent) {
    return Container(
        margin: const EdgeInsets.all(5),
        width: 70,
        alignment: Alignment.center,
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              checkColor: Colors.grey,
              fillColor: MaterialStateProperty.all<Color>(Colors.green),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  days[title] = value!;
                });
              },
            ),
            Text(title,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ));
  }
}
