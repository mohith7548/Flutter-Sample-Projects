import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Battery _battery = Battery();
  int _batteryLevel;
  BatteryState _batteryState;

  @override
  void initState() {
    super.initState();
    _battery.batteryLevel.then((int value) {
      setState(() {
        _batteryLevel = value;
      });
    });
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      _battery.batteryLevel.then((int value) {
        setState(() {
          _batteryLevel = value;
          _batteryState = state;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battery Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Battery Leve: $_batteryLevel %'),
            const SizedBox(height: 16.0),
            Text('Battery State: $_batteryState'),
          ],
        ),
      ),
    );
  }
}
