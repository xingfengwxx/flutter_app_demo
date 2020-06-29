import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridViewDemo'),
        ),
        body: GridViewDemo(),
      ),
    );
  }
}

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    //横向ListView
//    return ListView.builder(
//      scrollDirection: Axis.horizontal,
//        itemBuilder: (BuildContext context, int index) {
//        return Text("$index 号技师");
//        }
//    );
    return GridWidget();
  }
}

class GridWidget extends StatelessWidget {
  const GridWidget({
    Key key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SliverGridDelegateWithMaxCrossAxisExtent 自行判断每行数量多少比较合适
    //SliverGridDelegateWithFixedCrossAxisCount 需要设定每行个数
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 3, crossAxisSpacing: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.cyanAccent,
            child: Center(child: Text('$index')),
          );
        },
        itemCount: 100,
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
                    'https://gank.io/images/b140f015a16e444aad6d76262f676a78'))));
  }
}
