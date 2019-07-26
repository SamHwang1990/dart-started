/**
 * 类继承：
 *    - 使用关键字 `extends SuperClass` 声明继承父类，dart 中为 单继承
 *    - 子类中使用 super 来引用父类结构
 *    - 使用 `@override` 声明方法覆写
 *    - 覆写 `==` 操作符时，需要同时覆写 `hashCode` getter 方法
 *    - 覆写 `noSuchMethod()` 方法，可以在实例调用不存在方法时触发
 * 
 * 类 Mixin：
 *    - 使用关键字 `with Mixin1, Mixin2` 声明 mixin 列表
 *    - 声明 mixin：（mixin 声明本质上是类声明）
 *        - 使用 class 声明，但不声明任何 constructor，此时该 mixin 本身是可以被实例化的
 *        - 使用 mixin 声明，此时该 mixin 本身不能被实例化
 */

main(List<String> args) {
  var point = Point(1, 2);
  point.printPoint();

  var xAxis = new XAxis();
  xAxis.x = 1;
  print(xAxis.x);
}

// 该 Mixin 可被实例化
class XAxis {
  num x;
}

// 该 Mixin 不可被实例化
mixin YAxis {
  num y;
}

class Point with XAxis, YAxis {
  Point(x, y) {
    this.x = x;
    this.y = y;
  }

  printPoint() => print('point: ($x, $y)');
}