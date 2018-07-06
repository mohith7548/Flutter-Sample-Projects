import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 256.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('SliverFab Example'),
                  background: Image.asset(
                    'assets/work.jpg',
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black26,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    20,
                    (int index) => ListTile(
                          title: Text('Tem $index'),
                        ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 256.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.favorite),
            ),
          )
        ],
      ),
    );
  }
}
