import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyanAccent,
      ),
      home: EditorDemo(),
    );
  }
}

class EditorDemo extends StatefulWidget {
  @override
  _EditorDemoState createState() => _EditorDemoState();
}

class _EditorDemoState extends State<EditorDemo> {
  var name;
  var pwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('输入框'),
        ),
        body: Center(
          //常用的 比较灵活的
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //输入框
              Container(
                width: 300,
                height: 80,
                child: TextField(
                  maxLength: 15,
                  cursorColor: Colors.cyan,
                  buildCounter: (
                    BuildContext context, {
                    @required int currentLength,
                    @required int maxLength,
                    @required bool isFocused,
                  }) {
                    return Text('当前 $currentLength/$maxLength');
                  },
                  toolbarOptions: ToolbarOptions(
                    copy: false
                  ),
                  onChanged: (val) => name = val,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0x30cccccc),
                    hintText: 'QQ/邮箱',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Colors.transparent, width: 1.0
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.transparent, width: 1.0)
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 80,
                child: TextField(
                  maxLength: 15,
                  cursorColor: Colors.cyan,
                  buildCounter: (
                      BuildContext context, {
                        @required int currentLength,
                        @required int maxLength,
                        @required bool isFocused,
                      }) {
                    return Text('当前 $currentLength/$maxLength');
                  },
                  toolbarOptions: ToolbarOptions(
                      copy: false
                  ),
                  onChanged: (val) => pwd = val,
                  onSubmitted: (val) => pwd = val,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0x30cccccc),
                    hintText: '密码',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          color: Colors.transparent, width: 1.0
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.transparent, width: 1.0)
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: (){
                  print('name=$name, pwd=$pwd');
                },
                child: Text('提交'),
              ),
            ],
          ),
        ));
  }
}
