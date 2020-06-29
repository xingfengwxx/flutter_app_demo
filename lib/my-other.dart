import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/my-route.dart';

class SecondPage extends StatefulWidget {
  //构造函数传参
  final msg;

  SecondPage({this.msg});


  @override
  _SecondPageState createState() => _SecondPageState(msg: msg);
}

class _SecondPageState extends State<SecondPage> {

  final msg;

  _SecondPageState({this.msg});


  @override
  Widget build(BuildContext context) {
    //settings传参
    Message arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        //stack
        //?.安全访问符
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('接收消息 msg ${msg?.msg} name ${msg?.name}'),
            RaisedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context, '这是来自第二个页面的消息');
              },
            )
          ],
        ),
      ),
    );
  }
}
