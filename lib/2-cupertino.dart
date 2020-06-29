
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: Colors.green,
      ),
      home: CupertinoDemo(),
    );
  }
}

class CupertinoDemo extends StatefulWidget {
  @override
  _CupertinoDemoState createState() => _CupertinoDemoState();
}

class _CupertinoDemoState extends State<CupertinoDemo> {


  var _current=0;

  List _list=[PageA('消息'),PageA('通讯录'),PageA('发现'),PageA('个人中心')];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder:(BuildContext context, int index){
        return _list[index];
      } ,
      tabBar: CupertinoTabBar(
        currentIndex: _current,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.mail),
            title: Text('消息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            title: Text('通讯录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('个人中心'),
          ),
        ],
      ),
    );
  }
}

class PageA extends StatefulWidget {
  var title;
  PageA(this.title);
  @override
  _PageAState createState() => _PageAState(title);
}

class _PageAState extends State<PageA> {
  var title;
  _PageAState(this.title);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('$title'),
      ),
      child: Text('$title'),);
  }
}
