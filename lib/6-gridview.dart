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
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
      return Text("$index 号技师");
    });
  }
}

class GridWidget extends StatelessWidget {
  const GridWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // SliverGridDelegateWithMaxCrossAxisExtent 自行判断每行数量多少比较合适
      //SliverGridDelegateWithFixedCrossAxisCount 需要设定每行个数
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 3, crossAxisSpacing: 3),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              color: Colors.redAccent,
              child: Center(child: Text('$index')));
        },itemCount: 100,);
  }
}
