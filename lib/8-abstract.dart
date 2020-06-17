main() {
  var sky = getClub('sky');
  var water = getClub('water');
  var yrk = getClub('yrk');
  sky.getMsg();
  water.getMsg();
  yrk.getMsg();
}

//重定向相当于 在一个构造函数里面调用另外一个构造函数
Club getClub (type){
  switch (type) {
    case 'sky':
      return SkyWorld();
      break;
    case 'water':
      return WaterWorld();
      break;
    case 'yrk':
      return Normal();
      break;
    default:
      throw '找不到相应的俱乐部';
      break;
  }
}

//构建工厂
//俱乐部
abstract class Club {
  Club.getClub();
  getMsg();
}

//天上人间
class SkyWorld extends Club {
  SkyWorld() : super.getClub();

  @override
  getMsg() {
    print('天上人间');
  }
}

//水世界
class WaterWorld extends Club {
  WaterWorld() : super.getClub();

  @override
  getMsg() {
    {
      print('水世界');
    }
  }
}

//意尔康
class Normal extends Club {
  Normal() : super.getClub();

  @override
  getMsg() {
    print('意尔康');
  }
}
