import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyAPP());

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _globalKey = GlobalKey();
  String _name;
  String _pwd;

  _login() {
    var currentState = _globalKey.currentState;
    if (currentState.validate()) {
      currentState.save();
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: Text('用户信息'),
                content: Column(
                  children: <Widget>[
                    Text('用户名字: $_name'),
                    Text('用户密码: $_pwd'),
                  ],
                ),
                actions: <Widget>[
                  acWidget(),
                  ac2Widget(),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login page'),
      ),
      body: Center(
        //表单
        child: Form(
          key: _globalKey,
          //列
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //editext
              Container(
                width: 250.0,
                height: 80.0,
                child: TextFormField(
                  //装饰器
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffcccccc),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(100)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(100)),
                      hintText: '请输入登录的用户'),

                  onSaved: (val) => _name = val,
                  //判断函数
                  validator: (val) => val.length < 5 ? '账户长度不够' : null,
                ),
              ),

              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 250.0,
                height: 80.0,
                child: TextFormField(
                  obscureText: true,
                  //装饰器
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffcccccc),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(100)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(100)),
                      hintText: '请输入登录的密码'),

                  onSaved: (val) => _pwd = val,
                  //判断函数
                  validator: (val) => val.length < 5 ? '密码长度不够' : null,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                onPressed: _login,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                padding:
                    EdgeInsets.only(left: 150, right: 150, top: 15, bottom: 15),
                child: Text(
                  '登录',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ac2Widget extends StatelessWidget {
  const ac2Widget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoDialogAction(
      onPressed: () {
        Navigator.of(context).pop(true);
      },
      child: Text('取消'),
    );
  }
}

class acWidget extends StatelessWidget {
  const acWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoDialogAction(
      onPressed: () {
        Navigator.of(context).pop(true);
      },
      child: Text('确定'),
    );
  }
}
