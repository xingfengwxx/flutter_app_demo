main() {

  Man man = Man.setData('王五', 20);

  Runes runes = new Runes('\u{1f605} \u{1f60e} \u{1f47b} \u{1f596} \u{1F64B} \u6211 \u{1F601}');
  var str1 = String.fromCharCodes(runes);
  print(str1);

}

//class Man {
//  String name;
//  int age;
//
//  //固定写法
//  call(a, b, c) => print('a=$a, b=$b, c=$c');
//
//  Man(this.name, this.age);
//
//  Man.hello(this.name, this.age);
//
//  Man.setInfo(name, age) : this.hello('尼古拉斯赵四', age);
//
//  @override
//  String toString() {
//    print('name=$name, age=$age');
//    return 'name=$name, age=$age';
//  }
//
//}

class Person {
  int age;
  String name;

  Person(this.name, this.age);

  Person.setData(this.name, this.age) {
    print(' Person name $name age = $age');
  }

  Person.setInfo(this.name, this.age) {
    print(' PersonInfo  name $name age = $age');
  }

  @override
  String toString() {
    print('name=$name, age=$age');
    return 'name=$name, age=$age';
  }
}

class Man extends Person {
  int age;
  Man.setData(String name, int age) :
      age = age,
  super.setInfo(name, age) {
    print('name=$name, age=$age');
  }
}