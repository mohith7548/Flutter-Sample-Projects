import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarLoadingScreen(),
    );
  }
}

class BarLoadingScreen extends StatefulWidget {
  @override
  _BarLoadingScreenState createState() => _BarLoadingScreenState();
}

class _BarLoadingScreenState extends State<BarLoadingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 3000,
      ),
    );
    animation = ColorTween(
      begin: const Color.fromRGBO(10, 10, 10, 0.5),
      end: const Color.fromRGBO(0, 200, 100, 0.5),
    ).animate(_controller)
      ..addListener(() => setState(() {}));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: animation.value,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Bar(),
              Bar(),
              Bar(),
              Bar(),
            ],
          ),
        ),
      ),
    );
  }
}

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.0,
      height: 15.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 255, 1.0),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            spreadRadius: 1.0,
            offset: Offset(1.0, 0.0),
          ),
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            spreadRadius: 1.0,
            offset: Offset(1.0, 0.0),
          ),
        ],
      ),
    );
  }
}
