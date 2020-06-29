import 'package:flutter/material.dart';

import 'my-other.dart';

main() => runApp(MyApp());

//局部跳转
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
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
        title: Text('ContainerDemo'),
      ),
      body: _list[_current],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.blue,
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
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
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => PageA());
      },
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
      child: Text('消息页面'),
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
      child: Text('好友页面'),
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
