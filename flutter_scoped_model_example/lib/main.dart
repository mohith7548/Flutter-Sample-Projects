import 'package:flutter/material.dart';
import 'package:flutter_scoped_model_example/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Counter Example',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScopedModel<AppModel>(
        model: AppModel(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Counter: '),
            const SizedBox(height: 8.0),
            ScopedModelDescendant<AppModel>(
              builder: (context, child, model) {
                return Text(model.count.toString(),
                    style: Theme.of(context).textTheme.display1);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => ButtonBar(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: model.increment,
            ),
            IconButton(
              icon: Icon(Icons.minimize),
              onPressed: model.decrement,
            ),
          ],
        ),
      ),
    );
  }
}
