import '9-mixin.dart' deferred as mix2;

main() {
  start();
}
//���߳�ģ�� ���첽���ʱ��Ϊ���ȼ����� û�����������
start() async {
  await mix2.loadLibrary();
}
