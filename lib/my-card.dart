import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: Scaffold(
        body: CardDemo(),
      ),
    );
  }
}

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[CardWidget(), CardWidget(), CardWidget(),],
    );
  }
}

class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      child: Column(
        children: <Widget>[
          Image.network(
              'https://gank.io/images/04d6b8ee9e964c04877da65b43952e89'
          ),
          Row(
            children: <Widget>[
              Container(
                width: 50,
                child: Icon(
                  Icons.star,
                  color: Colors.redAccent,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('小泽'),
                    Text('服务优秀，身材极佳'),
                  ],
                ),
              ),
              Container(
                width: 50,
                child: Icon(Icons.favorite),
              )
            ],
          )
        ],
      ),
    );
  }
}


