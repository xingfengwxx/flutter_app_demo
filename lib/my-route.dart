import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my-other.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 先定义路由跳转
      theme: ThemeData(
          primaryColor: Colors.orange
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: RoutesDemo(),
      ),
    );
  }
}

class RoutesDemo extends StatefulWidget {
  @override
  _RoutesDemoState createState() => _RoutesDemoState();
}

class _RoutesDemoState extends State<RoutesDemo> {

  var _result;

  _activityResultCode(context) async {
    // Navigator 也是个widget
    var result = await Navigator.push(
      //intent bundle
      //activity result code
        context,
        MaterialPageRoute(
          builder: (context) =>
              SecondPage(
                msg: Message('simon', '来自首页的消息'),
              ),
        )
    );
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('$_result'),
          RaisedButton(
            child: Text('点击跳转'),
            onPressed: () {
              _activityResultCode(context);
            },
          ),
        ],
      ),
    );
  }
}


class Message {
  var name;
  var msg;

  Message(this.name, this.msg);
}

