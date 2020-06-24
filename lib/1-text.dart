import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: TextDemo(),
    );
  }
}

class TextDemo extends StatefulWidget {
  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('TextDemo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Container(
//              width: 100,
//              child: Text(
//                '兽人永不为奴，熊人族无所畏惧',
//                style: TextStyle(
//                  fontSize: 30.0,
//                  color: Colors.redAccent,
////                  decoration: TextDecoration.underline,
////                  decorationColor: Colors.blue,
////                  decorationStyle: TextDecorationStyle.wavy,
//                  shadows: [Shadow(offset: Offset(3,3),blurRadius: 5,
//                  color: Colors.yellow)],
//                ),
//
//              ),
//            ),
            //richtext  一定要设置style否则会报错
            //of是一种约定 如果你希望一个对象暴露给外面，就用of暴露给对方
            RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 20, color: Colors.yellow),
                  children: [
                    TextSpan(text: '人类懂王'),
                    TextSpan(text: '川老师', style: TextStyle(color: Colors.blue)),
                    TextSpan(
                        text: '欢迎来到动脑学院',
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                        //..级联 没有自带的 webview 需要第三方库 第三方的不好用
                        recognizer: TapGestureRecognizer()..onTap = () async{
                          String url='https://www.dongnaoedu.com/';
                          if(await canLaunch(url)){
                            await launch(url);
                          }else{
                            throw 'error $url';
                          }
                        }),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
