main() {
//  Man man = Man.dongnao('李四', 18);
//  //容易把方法和类搞混淆
//  man(10, 15, 20);


  Man man = Man.setData('张三', 18);

}

//class Man {
//  String name;
//  int age;
//
//  //固定写法
//  call(a, b, c) => print('a = $a b = $b c = $c');
//
//  Man(this.name, this.age);
//
//  Man.dongnao(this.name, this.age);
//
//  Man.setZSInfo(name, age) : this.dongnao('张三', age);
//
//  @override
//  String toString() {
//    print('name = $name age = $age');
//    return 'name = $name age = $age';
//  }
//}

class Person{
  int age;
  String name;
  Person.setData(this.name,this.age){
    print(' Person name $name age = $age');}
    //名字是形式上的意义
  Person.zhangsan(this.name,this.age){
    print(' PersonInfo  name $name age = $age');}

  Person(this.name,this.age);

  @override
  String toString() {
    print('name = $name age = $age');
    return 'name = $name age = $age';
  }
}

class Man extends Person{
  int  age;


  Man.setData(String name, int age) :
        age=age,
        super.zhangsan(name, age){
    print('name $name age = $age');
  }


}
