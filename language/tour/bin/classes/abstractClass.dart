/**
 * Abstract Class，抽象类
 * 
 * 与正常类基本一样，比如：
 *    - 声明、初始化实例变量
 *    - 支持所有类型的构造函数
 * 
 * 差别在于：
 *    - 抽象类不能使用实例化
 *    - 抽象类允许声明抽象方法，只有签名，不需要方法体，需要子类自行实现
 */

main(List<String> args) {
  var point = new XAxisPoint(100);

  point.printPoint();
  print(point.distance());
}

abstract class Point {
  num x, y;

  Point(this.x, this.y);

  printPoint() => print('point: ($x, $y)');

  num distance();
}

class XAxisPoint extends Point {
  XAxisPoint(x): super(x, 0);

  @override
  num distance() {
    return x;
  }
}