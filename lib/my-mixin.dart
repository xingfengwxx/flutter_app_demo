import 'package:flutterapp/9-mixin.dart';

main() {
  Bicycle().getInfo();
  Motor().getInfo();
  Car().getInfo();

  var car = Car();
  car(10, 15);

  AB().showMsg();
  BA().showMsg();
  ABP().showMsg();
}

//交通工具
abstract class Transportation {
  call(x, y) => print('$x $y');
  getInfo();
}

abstract class LowSafe {
  getSafe() => '安全系数：低';
}

abstract class MidSafe {
  getSafe() => '安全系数：中';
}

abstract class FootPower {
  getPower() => '动力系统：脚动';
}

abstract class PetrolPower {
  getPower() => '动力系统：汽油';
}

abstract class TowWheels {
  getWheels() => '轮子数量：两个';
}

abstract class FourWheels {
  getWheels() => '轮子数量：四个';
}

//自行车
class Bicycle extends Transportation with FootPower, LowSafe, TowWheels {

  @override
  getInfo() {
    print('Bicycle ${getSafe()} ${getPower()} ${getWheels()}');
  }
}

//摩托车
class Motor extends Transportation with PetrolPower, LowSafe, TowWheels {
  @override
  getInfo() {
    print('Motor   ${getSafe()} ${getPower()} ${getWheels()}');
  }
}

//汽车
class Car extends Transportation with PetrolPower, LowSafe, FourWheels {
  @override
  getInfo() {
    print('Car     ${getSafe()} ${getPower()} ${getWheels()}');
  }
}



class A {
  showMsg() {
    print('A');
  }
}

class B {
  showMsg() {
    print('B');
  }
}

class C {
  showMsg() {
    print('C');
  }
}

class P {
  showMsg() {
    print('P');
  }
}

class BA extends C with B,A {

}

class AB extends C with A,B {

}

//with是线性 是通过新建类来实现的 implements 只是表明要实现你要实现这个方法
class ABP extends C with A,B implements P {
  @override
  showMsg() {
    print('ABP');
  }
}

