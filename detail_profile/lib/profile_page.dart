import 'dart:ui' as ui;
import 'package:detail_profile/user_model.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = User(
    firstName: 'Kune',
    lastName: 'Mohith',
    location: 'AndhraPradesh, India',
    biography:
        'Mohith Kune is a Programmer, Developer, Auntrepreneur, Linux enthusiast. He likes to Code and loves to play games like cricket. He has been coding since his college days. He is on the few artistic programmers around the world.',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/kunemohith.jpg',
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildInfo(),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            user.firstName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Text(
            user.lastName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            user.location,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 255.0,
            height: 1.0,
            color: Colors.white,
          ),
          Text(
            user.biography,
            style: TextStyle(
              color: Colors.white,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, top: 32.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Colors.white30)),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/kunemohith.jpg'),
        radius: 55.0,
        backgroundColor: Colors.white30,
      ),
    );
  }
}
