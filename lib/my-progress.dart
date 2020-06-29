import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ProgressDemo'),
        ),
        body: ProgressDemo(),
      ),
    );
  }
}

class ProgressDemo extends StatefulWidget {
  @override
  _ProgressDemoState createState() => _ProgressDemoState();
}

class _ProgressDemoState extends State<ProgressDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LinearProgressIndicator(
            // value: 0.3,
          ),
          SizedBox(height: 10,),
          CircularProgressIndicator(),
          SizedBox(height: 10,),
          CupertinoActivityIndicator(
            radius: 20,
          )
        ],
      ),
    );
  }
}

