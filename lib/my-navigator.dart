import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/my-route.dart';

import 'my-other.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.tealAccent
      ),
      home: BottomDemo(),
    );
  }
}

class BottomDemo extends StatefulWidget {
  @override
  _BottomDemoState createState() => _BottomDemoState();
}

class _BottomDemoState extends State<BottomDemo> {
  var _current = 0;

  _choose(index) {
    setState(() {
      _current = index;
    });
  }

  List _list = [NavigatorDemo(), PageB(), PageC(), PageD()];

  @override
  Widget build(BuildContext context) {
    //必须要写的属性 不写报错
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomDemo'),
      ),
      body: _list[_current],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.blueAccent,
        selectedItemColor: Colors.redAccent,
        currentIndex: _current,
        onTap: (index) => _choose(index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('好友')),
          BottomNavigationBarItem(icon: Icon(Icons.dialpad), title: Text('我的')),
        ],
      ),
    );
  }
}

class NavigatorDemo extends StatefulWidget {
  @override
  _NavigatorDemoState createState() => _NavigatorDemoState();
}

class _NavigatorDemoState extends State<NavigatorDemo> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (context) => PageA());
      },
    );
  }
}


class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('局部跳转'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(
            msg: Message('狮子狗', '猎人从不休息'),
          )));
        },
      ),
    );
  }
}

class PageB extends StatefulWidget {
  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('消息'),
    );
  }
}

class PageC extends StatefulWidget {
  @override
  _PageCState createState() => _PageCState();
}

class _PageCState extends State<PageC> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('好友'),
    );
  }
}

class PageD extends StatefulWidget {
  @override
  _PageDState createState() => _PageDState();
}

class _PageDState extends State<PageD> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('个人中心'),
    );
  }
}


