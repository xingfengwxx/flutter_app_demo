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
          title: Text('CupertinoDemo'),
        ),
        body: CupertinoDemo(),
      ),
    );
  }
}

class CupertinoDemo extends StatefulWidget {
  @override
  _CupertinoDemoState createState() => _CupertinoDemoState();
}

class _CupertinoDemoState extends State<CupertinoDemo> {


  LoginStatus _status=LoginStatus.normal;

  Widget _getChild(){
    if(_status==LoginStatus.normal){
      return Text('登录');
    }else if(_status== LoginStatus.loading){
      return CupertinoActivityIndicator();
    }else if(_status == LoginStatus.done ){
      return Icon(Icons.check);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//          CupertinoButton(
//            child: Text('登录'),
//            onPressed: () {},
//            color: Colors.redAccent,
//          )
            RaisedButton(
              onPressed: (){
                setState(() {
                  if(_status==LoginStatus.normal){
                    _status=LoginStatus.loading;
                    Future.delayed(Duration(seconds: 2)).then((val){
                      setState(() {
                        _status=LoginStatus.done;
                      });
                    });
                  }
                });
              },
              child: _getChild(),
            )
        ]));
  }
}

enum LoginStatus{
  normal,loading,done
}