main() {
  var singleTon = SingleTon.getInstance('尼古拉斯赵四');
  var singleTon2 = SingleTon.getInstance('亚历山大刘能');

  print(singleTon == singleTon2);
  print(identical(singleTon, singleTon2));
}

////饿汉式 单例
//class SingleTon {
//  //_下划线表示 私有 可以修饰 方法 或 属性 或文件
//  //重命名构造函数 _()
//  SingleTon._();
//  static final SingleTon _singleTon = SingleTon._();
//
//  //工厂函数的关键字  通过代码决定返回的实例  从缓存中返回实例
//  factory SingleTon.getInstance() => _singleTon;
//
//}



/*// 懒汉式
class SingleTon {
  SingleTon._internal();

  static SingleTon _singleTon;
  // 三目操作符
  factory SingleTon.getInstance() => _singleTon ??= SingleTon._internal();
}*/



// 第三种单例写法
class SingleTon {
  String name;
  static final Map<String, SingleTon> _cache = Map();

  SingleTon._internal(this.name);

  factory SingleTon.getInstance(name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      SingleTon singleTon = SingleTon._internal(name);
      _cache[name] = singleTon;
      return singleTon;
    }
  }
}


