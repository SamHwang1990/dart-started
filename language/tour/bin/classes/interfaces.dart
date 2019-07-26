/**
 * Interface，接口定义
 * 
 * Dart 没有专门的 interface 声明方式，而是使用 Implicit interfaces 的机制，
 * 所有定义的 class 就是一个 interface
 * 
 * 使用 interface 需要关键字：`implements`
 * 
 */

main(List<String> args) {
  var point = XAxisPoint(1);

  print(point.distance());
}

class IPoint {
  num x, y;

  num distance() => x + y;
}

class XAxisPoint implements IPoint {
  num x, y = 0;

  XAxisPoint(this.x);

  num distance() => x;
}