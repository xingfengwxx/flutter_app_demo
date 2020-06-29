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
      children: <Widget>[CardWidget(), CardWidget(), CardWidget()],
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      child: Column(
        children: <Widget>[
          Image.network(
              'https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1719187876,1243668359&fm=26&gp=0.jpg'),
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
                  child: Icon(Icons.favorite))
            ],
          )
        ],
      ),
    );
  }
}
