import 'package:flutter/material.dart';
import 'package:flutter_backdrop/two_panels.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backdrop Widget',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BackdropPage(),
    );
  }
}

class BackdropPage extends StatefulWidget {
  @override
  _BackdropPageState createState() => _BackdropPageState();
}

class _BackdropPageState extends State<BackdropPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => onPressed(),
          icon: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _controller.view,
          ),
        ),
        title: Text('Backdrop'),
      ),
      body: TwoPanels(
        controller: _controller,
        onPressed: onPressed,
      ),
    );
  }

  onPressed() {
    _controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
  }
}
