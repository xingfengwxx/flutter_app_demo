import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ContainerDemo'),
        ),
        body: ContainerDemo(),
      ),
    );
  }
}

class ContainerDemo extends StatefulWidget {
  @override
  _ContainerDemoState createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //div
          GirlWidget()
        ]
      ),
    );
  }
}

class GirlWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      //装饰器 pi是180
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: Colors.blue),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592977813999&di=c2bddc64d6081bd85cabbc126d07f237&imgtype=0&src=http%3A%2F%2Fimg.improve-yourmemory.com%2Fpic%2F78739853e99028b1705d953bf722b341-4.jpg'
          )
        )
      ),
    );
  }
}


