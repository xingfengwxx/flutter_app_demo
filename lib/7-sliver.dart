import 'dart:math';

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
        body: SliverDemo(),
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
        SliverAppBar(
          title: Text('客官来玩啊'),
          leading: Icon(Icons.menu),
          centerTitle: true,
          //收缩区高度
          expandedHeight: 200,
          //随时可以出现appbar
          floating: true,
        stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('N号技师'),
            centerTitle: true,
            stretchModes: [StretchMode.fadeTitle,StretchMode.zoomBackground,StretchMode.blurBackground],
            background: Image.network(
              'https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1719187876,1243668359&fm=26&gp=0.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
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
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592671455262&di=a0a0136926cd314a0ca2e1fe571e7289&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3030014422%2C2546721547%26fm%3D214%26gp%3D0.jpg'))));
  }
}
