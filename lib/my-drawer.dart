import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/11-drawer.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('DrawerDemo'),
        ),
        body: SliverDemo(),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              HeaderWidget(),
              ListTile(
                leading: GirlWidget(),
                title: Text('提款姬'),
                subtitle: Text('0号英雄'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: GirlWidget(),
                title: Text('喜之郎'),
                subtitle: Text('1号英雄'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: GirlWidget(),
                title: Text('娃娃鱼'),
                subtitle: Text('2号英雄'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              AboutListTile(
                icon: Icon(Icons.info),
                applicationName: '召唤师峡谷',
                applicationIcon: FlutterLogo(),
                aboutBoxChildren: <Widget>[
                  Text('英雄联盟'),
                  Text('腾讯游戏')
                ],
                child: Text('玩英雄联盟的奇技淫巧'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Sliver 系列组件
class SliverDemo extends StatefulWidget {
  @override
  _SliverDemoState createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  List _list;

  //需要一个ScrollControl
  ScrollController _scrollController;

  Future _reFreshData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _list = List.generate(Random().nextInt(7) + 8, (_) {});
      });
    });
  }

  _addMore() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _list.addAll(List.generate(Random().nextInt(5), (_) {}));
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reFreshData();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _addMore();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    //只有一套滑动 意味着可以同时使用listview与gridview
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          onRefresh: _reFreshData,
        ),
        _list == null
            ? SliverFillRemaining(
                child: Center(
                    child: CupertinoActivityIndicator(
                  radius: 20,
                )),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    leading: GirlWidget(),
                    title: Text('$index 号技师'),
                    subtitle: Text('擅长推拿，足浴'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                },
                childCount: _list.length,
              )),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 3, crossAxisSpacing: 3),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                  color: Colors.redAccent,
                  child: Center(child: Text('$index')));
            },
          ),
        )
      ],
    );
  }
}

class GirlWidget extends StatelessWidget {
  const GirlWidget({
    Key key,
  }) : super(key: key);

  //engine
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50.0,
        height: 50.0,
        //装饰器  pi是180
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.blue),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://gank.io/images/21c417e3a84842bfa585dee686f6b992'))));
  }
}
