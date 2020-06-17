main() {
//  var singleTong = SingleTong.getInstance('zhangsan');
//  var singleTong2 = SingleTong.getInstance('lisi');
//
//  print(singleTong == singleTong2);
//  print(identical(singleTong, singleTong2));
}

class Tools{
  fTools(){

  }
}

//饿汉式 单例
//class SingleTong{
//  //_下划线表示 私有 可以修饰 方法 或 属性 或文件
////重命名构造函数 _()
//  SingleTong._internal();
//
//  static final SingleTong _singleTong=SingleTong._();
//
//  //工厂函数的关键字  通过代码决定返回的实例  从缓存中返回实例
//  factory SingleTong.getInstance()=>_singleTong;
//
//}
//懒汉式
//class SingleTong{
//  SingleTong._internal();
//
//  static SingleTong _singleTong;
//  三目操作符
//  factory SingleTong.getInstance()=>_singleTong??=SingleTong._internal();
//
//}
//第三种单例写法
//class SingleTong {
//  String name;
//  static final Map<String, SingleTong> _cache = Map();
//
//  SingleTong._internal(this.name);
//
//  factory SingleTong.getInstance(name) {
//    if (_cache.containsKey(name)) {
//      return _cache[name];
//    } else {
//      SingleTong singleTong = SingleTong._internal(name);
//      _cache[name] = singleTong;
//      return singleTong;
//    }
//  }
//}

class Man {
  num age;

  Man(this.age);

  Man.setAge(this.age);
}
