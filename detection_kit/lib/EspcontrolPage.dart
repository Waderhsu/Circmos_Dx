import 'package:flutter/material.dart';

class EspcontrolPage extends StatefulWidget {
  @override
  _EspcontrolPage createState() => new _EspcontrolPage();
}

class _EspcontrolPage extends State<EspcontrolPage> {
  bool switchValue = false;
  double temperatureValue = 42.5;
  int timeValue = 930;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heating Temperature and Time'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Icon(
              Icons.thermostat,
              color: Colors.red,
              size: 150.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Temperature:' + temperatureValue.toString() + '°C',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.timer,
              color: Colors.black,
              size: 150.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Time:' + (timeValue~/60).toString() + ' min ' + (timeValue%60).toString() + ' sec',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SwitchListTile(
                title: const Text(
                  'Heating',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Turn OFF/ON',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: switchValue,
                onChanged: (bool value) {

                  setState(() {
                    switchValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}