import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '8-route.dart';


class SecondPage extends StatefulWidget {
  //构造函数传参
  SecondPage({this.msg});

  final msg;

  @override
  _SecondPageState createState() => _SecondPageState(msg: msg);
}

class _SecondPageState extends State<SecondPage> {
  _SecondPageState({this.msg});

  final msg;

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
            Text('接收消息 msg ${msg?.msg}  name ${msg?.name}'),
            RaisedButton(
              child: Text('返回'),
              onPressed: () {
//              Navigator.of(context).pop();
                Navigator.pop(context, '这是来自第二个页面的消息');
              },
            )
          ],
        ),
      ),
    );
  }
}
