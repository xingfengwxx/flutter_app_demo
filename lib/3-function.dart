main() {
  //匿名无参函数定义
//  var myfuc=(){print('dongnao');};
//  myfuc();

  //匿名有参定义
//  var myfuc=(val){print('$val');};
//  myfuc('dongnao');

//匿名无参定义不推荐
//  int b=10;
  //形参 不要在意名字
//  (ss,s){print('$ss $s');}(b,b);

//胖箭头
//  var myfuc = () => print('dongnao');
//  myfuc();

  //匿名函数
//  List ls = [1, 2, 3, 4, 5];
  //myGame的方法处理list
  // 这个func就是将传进来的值乘以5返回
//  myGame(List ls, int ff(a)) {
//    for (int i = 0; i < ls.length; i++) {
//      ls[i] = ff(ls[i]);
//    }
//    print(ls);
//  }
//  myGame(ls, (a)=>a * 5);

//  List ls = ['aa','bb',3];
//  List ls2 = ['dongnao simon',true,123];
//  //闭包
//  Function weGame(List ls,func(a)){
//    for(int i=0;i<ls.length;i++){
//      ls[i] = func(ls[i]);
//    }
//    return (ls2)=>ls2+ls;
//  }
//  var weGame2 = weGame(ls, (a) =>a*2);
//
//  print(weGame2(ls2));
// 闭包用途
//  Function content() {
//    int a = 0;
//    ++a;
//    print('$a');
//  }
//
//  Function content2() {
//    int a = 0;
//    return () {
//      ++a;
//      print('$a');
//    };
//  }
//  var content22 = content2();
//  content22();
//  content22();
//  content22();
//  函数别名
//  int a=10,b=15;
//  MyOperator myOperator;
//  myOperator=add;
////  print(myOperator(a,b));
//
//  print(addMore(a,b,myOperator));



}

addMore(int a , int b,  MyOperator myOperator){
  a=b*5;
  return myOperator(a,b);
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
  print('a = $a b = $b c = $c');
}

//可选命名 参数
void login2(int a, {int b = 5, int c = 5}) {
  print('a = $a b = $b c = $c');
}
