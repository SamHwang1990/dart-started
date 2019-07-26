/**
 *  - `?.`：类似于`.` 操作符，作用是从左操作数中读取右操作数对应的属性，
 *          当左操作数为 null，则直接返回 null，而不会报错
 *  - `~/`：除法运算，并将结果取整
 *  - `is`, `is!`：类似于 js 中的 `instanceof`，用于判断左操作数是否为右操作数的实例
 *  - `??`：类似于 js 中的 `||`，
 *          当左操作数为 null 时，返回右操作数，
 *          当左操作数不为 null 时，返回左操作数
 *  - `..`：Cascade notation，用于链式访问对象属性
 */

void main(List<String> args) {
  var nullObj = null;

  print(nullObj?.abc);
  print(5/2);
  print(5~/2);

  print(new _Person() is _Person);
  print(nullObj is! _Person);

  // print((new _Man() as _Person).name());

  print(true??1);
  print(false??1);
  print(null??1);

  print(
    new _Person()
      ..man().gender()
      ..name()
  );
}

class _Person {
  String name() {
    return 'person';
  }

  _Man man() => new _Man();
}

class _Man {
  String gender() {
    return 'man';
  }
}