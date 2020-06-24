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
          appBar: AppBar(
            title: Text('ContainerDemo'),
          ),
          body: ListViewDemo()),
    );
  }
}

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List _list;



  Future _reFreshData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _list = List.generate(Random().nextInt(15), (_) {});
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reFreshData();
  }

  @override
  Widget build(BuildContext context) {
    //itemBuilder相当于android的 适配器
    return _list == null
        ? Center(child: CupertinoActivityIndicator(radius: 20,))
        : RefreshIndicator(
            //onRefresh 不能为空
            onRefresh: _reFreshData,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 2,
                    color: Colors.redAccent,
                  );
                },
                itemCount: _list.length,
                //懒加载
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: GirlWidget(),
                    title: Text('$index 号技师'),
                    subtitle: Text('擅长推拿，足浴'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                }),
          );
  }
}

class LowWidget extends StatelessWidget {
  const LowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          selected: true,
          leading: GirlWidget(),
          title: Text('1号技师'),
          subtitle: Text('擅长推拿，足浴'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: GirlWidget(),
          title: Text('1号技师'),
          subtitle: Text('擅长推拿，足浴'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: GirlWidget(),
          title: Text('1号技师'),
          subtitle: Text('擅长推拿，足浴'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: GirlWidget(),
          title: Text('1号技师'),
          subtitle: Text('擅长推拿，足浴'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: GirlWidget(),
          title: Text('1号技师'),
          subtitle: Text('擅长推拿，足浴'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
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
