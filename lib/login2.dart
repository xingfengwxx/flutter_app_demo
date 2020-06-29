import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      home: LoginPage(),
    ));

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _valueKey = GlobalKey<FormState>();

  String _name;
  String _pwd;

  _login() {
    final form = _valueKey.currentState;
    if (form.validate()) {
      form.save();

      showDialog(context: context, builder: (ctx)=> new AlertDialog(
        content:  new Text('$_name $_pwd'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginPage')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Form(
                key: _valueKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          prefixIcon: Icon(Icons.account_circle),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          hintText: '请输出账号'),
                      onSaved: (value) {
                        print("value=$value");
                        _name = value;
                      },
                      validator: (val) {
                        return val.length < 6 ? '账号长度小于6位' : null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      onSaved: (value) {
                        print("value=$value");
                        _pwd = value;
                      },
                      validator: (val) {
                        return val.length < 6 ? '密码长度小于6位' : null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintText: '请输入密码',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      onPressed: () => {_login()},
                      child: Text('登录'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
