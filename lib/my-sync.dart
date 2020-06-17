import 'dart:async';
import 'dart:io';

import 'dart:isolate';

//main() {
//  start1();
//  start2();
//}

main() async {
  //创建接收消息的对象 receivePort
  //耗时几十毫秒内就用Future 几百毫秒用Isolate
  var receivePort = ReceivePort();
  //新建一个 Isolate 并且将自己的sendport交于对方
  Isolate.spawn(io_isolate, receivePort.sendPort);
  //IO Isolate的发送对象 receivePort调用first方法后就不能复用了
  var ioIsolate = await receivePort.first as SendPort;
  var msg = [1, '1号任务'];
  var msg2 = [2, '2号任务'];
  print(await create_isolate(ioIsolate, msg));
  print(await create_isolate(ioIsolate, msg2));
}

//这是 多线程
create_isolate(SendPort ioIsolate, msg) {
  print('create start');
  //askReceive用于数据交互的接收对象
  var askReceive = ReceivePort();
  //讲消息和用于数据交互的sendPort发送过去
  ioIsolate.send(msg+[askReceive.sendPort]);
  print('create end');
  return askReceive.first;
}

io_isolate(SendPort sendPort) {
  print('io start');
  var receivePort = ReceivePort();
  //将IO isolate的发送对象发回去 相当于绑定过程
  sendPort.send(receivePort.sendPort);
  receivePort.listen((message) {
    print('$message');
    if (message[0] == 1) {
      //接收用于数据交互的sendPort
      SendPort askSendPort = message[2] as SendPort;
      print('收到主线程消息 开始执行${message[1]}');
      sleep(const Duration(seconds: 5));
      askSendPort.send('1号任务执行完成');
    } else if (message[0] == 2) {
      //接收用于数据交互的sendPort
      SendPort askSendPort = message[2] as SendPort;
      print('收到主线程消息 开始执行${message[1]}');
      sleep(const Duration(seconds: 2));
      askSendPort.send('2号任务执行完成');
    }
  });
  print('io end');
}

//线程会阻塞5S 协程会直接执行后面代码
//Future 分布式并发的概念
//Future 表示在未来某个时间点，会获取到一个值
//被调用的Future做2件事，把自己放入队列，返回一个未完成的Future对象
//当完成之后这个对象就变成已完成对象
//CPU有个轮询

Future start1() async {
  print('2');
  await Future.delayed(const Duration(seconds: 2), () => print('7'));
  print('8');
}

start2() async {
  print('3');
  await Future.delayed(const Duration(seconds: 2), () => print('5'));
  print('6');
}
//在Isolate里面是单线程的