
main() {
  // 匿名无参函数定义
//  var myfun = () {print("hello world");};
//  myfun();



// 匿名有参函数定义
//var myfun = (val) {
//  print("$val");
//};
//
//myfun('hello world!');



//匿名无参定义不推荐
//int b = 10;
//(s1, s2) {
//  print('$s1, $s2');
//}(b, b);



//胖箭头
//var myfun = () => print('hello');
//myfun();



//匿名函数
//List ls = [1, 2, 3, 4, 5];
////myGame的方法处理list
//myGame(List ls, int ff(a)) {
//  for (int i = 0; i < ls.length; i++) {
//    ls[i] = ff(ls[i]);
//  }
//  print(ls);
//}
//myGame(ls, (a) => a * 5);



//闭包
//List ls = ['aa', 'bb', 3];
//List ls2 = ['hello dog', true, 123];
//Function weGame(List ls, func(a)) {
//  for (int i = 0; i < ls.length; i++) {
//    ls[i] = func(ls[i]);
//  }
//  return (ls2) => ls2 + ls;
//}
//var weGame2 = weGame(ls, (a) => a * 2);
//print(weGame2(ls2));
//
////闭包用途
//Function content() {
//  int a = 0;
//  ++a;
//  print('$a');
//}
//
//Function content2() {
//  int a= 0;
//  return () {
//    ++a;
//    print('$a');
//  };
//}
//
//var content22 = content2();
//content22();
//content22();
//content22();



//函数别名
int a = 10, b = 15;
MyOperator myOperator;
myOperator = add;
print(myOperator(a, b));
print(addMore(a, b, myOperator));

}

addMore(int a, int b, MyOperator myOperator) {
  a = b * 5;
  return myOperator(a, b);
}

typedef MyOperator(int a, int b);

add(int a, int b) {
  return a + b;
}

sub(int a, int b) {
  return a - b;
}

//可选位置 参数
void login(int a, [int b = 5, int c = 5]) {
  print('a = $a, b = $b, c = $c');
}

void login2(int a, {int b = 5, int c = 5}) {
  print('a = $a, b = $b, c = $c');
}