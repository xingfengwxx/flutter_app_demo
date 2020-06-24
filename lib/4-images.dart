import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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
          body: ImageDemo()),
    );
  }
}
//images 4种生成方式

class ImageDemo extends StatefulWidget {
  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //资源
          Image.asset(
            'assetes/images/lsn1.png',
            width: 200,
            height: 200,
          ),
          //网络
          Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592671455262&di=a0a0136926cd314a0ca2e1fe571e7289&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3030014422%2C2546721547%26fm%3D214%26gp%3D0.jpg',
            width: 200,
            height: 200,
          ),
          //缓存
          MemoryImg(),
          //文件加载
          OpenCamera(),
          //SD卡选择
          SDcardImg(),
        ],
      ),
    ));
  }
}

class MemoryImg extends StatefulWidget {
  @override
  _MemoryImgState createState() => _MemoryImgState();
}

//缓存中加载图片
class _MemoryImgState extends State<MemoryImg> {
  Uint8List _img;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImg();
  }

  _getImg() async {
    // rootBundle 是dart里面的资源管理对象 可以访问到资源里面的文件
    await rootBundle.load('assetes/images/lsn1.png').then((val) {
      if (mounted) {
        setState(() {
          _img = val.buffer.asUint8List();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _img == null ? Text('没有相应资源') : Image.memory(_img);
  }
}

//文件加载
class OpenCamera extends StatefulWidget {
  @override
  _OpenCameraState createState() => _OpenCameraState();
}

class _OpenCameraState extends State<OpenCamera> {
  var _img;

  //activityresult code
  _openCamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() => _img = File(image.path));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _img == null
            ? Text('请选择图片')
            : Image.file(_img),
        RaisedButton(
          child: Text('打开相机'),
          onPressed: _openCamera,
          color: Colors.blueAccent,
          splashColor: Colors.greenAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(width: 2.0, color: Colors.redAccent)),
          elevation: 20,
        ),
      ],
    );
  }
}

class SDcardImg extends StatefulWidget {
  @override
  _SDcardImgState createState() => _SDcardImgState();
}

class _SDcardImgState extends State<SDcardImg> {
  var _img;

  _getImg() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    //需要异步才能调用到path
    String appDocPath = appDocDir.path;
    //sdcard/Android/data/com.example.lutterlsn6/files 协程
    var path = (await getExternalStorageDirectory()).path;

    setState(() {
      print('tempPath = $tempPath appDocPath=$appDocPath');
      _img = File(path + '/2020319/lsn2.png');
    });
  }

  @override
  Widget build(BuildContext context) {
    return _img == null ? Text('没有相应资源') : Image.file(_img);
  }
}
