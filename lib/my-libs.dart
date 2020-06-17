import 'my-mixin.dart' deferred as mix2;

main() {
  start();
}

//单线程模型 做异步大多时候为优先级调度 没有锁这个概念
start() async {
  await mix2.loadLibrary();
}