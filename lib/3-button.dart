import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('ContainerDemo'),
          ),
          body: ButtonDemo()),
    );
  }
}

class ButtonDemo extends StatefulWidget {
  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Material���button ͹��İ�ť
          //��дonPressed�޷����
          RaisedButton(
            child: Text('RaisedButton'),
            onPressed: () {},
            color: Colors.blueAccent,
            splashColor: Colors.greenAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(width: 2.0, color: Colors.redAccent)),
            elevation: 20,
          ),
          //ƽ��button
          FlatButton(
            child: Text('FlatButton'),
            onPressed: () {},
            color: Colors.blueAccent,
            splashColor: Colors.greenAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(width: 2.0, color: Colors.redAccent)),
          ),
          //��������button
          OutlineButton(
            child: Text('OutlineButton'),
            onPressed: () {},
            color: Colors.blueAccent,
            splashColor: Colors.greenAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(width: 2.0, color: Colors.redAccent)),
          )
        ],
      ),
    );
  }
}
