main() {
  // ?.
//  String str = 'hello';
//  print(str != null ? str.length : null);
//  //等效写法
//  print(str?.length);
//  print(1/3);
//  //取商 取整
//  print(1~/2);
//  num a = 10;
//  print(a is! int);

// 三目运算符 ??
//  String str;
//  str == null ? 'hello' : str;
//  str ??= 'hello';
//  print(str);

//级联
//  StringBuffer stringBuffer = StringBuffer();
//  stringBuffer
//    ..write('hello\n')
//    ..write('android\n')
//    ..writeAll(['dart', '语法基础']);
//  print(stringBuffer);

  List ls = [1, 2, 3, 4, 5];
  List ls2 = [true, 2, 3, 4, 5];
  //迭代器
  ls.forEach((element) {
    print('$element');
  });
  //遇事不决请用var
  for (var i in ls2) {
    print('$i');
  }

}
