/**
 * 
 * Dart Class Constructors:
 * 
 * 声明实例变量
 * 
 * 构造函数类型：
 *    - Main Constructor，与类同名的构造函数
 *    - Named Constructor (with additional identifier)，提供更多的构造函数签名入口
 *    - Default Constructor，当类中没有显式声明一个构造函数时（Main Constructor、Named Constructor），
 *                            dart 就会给该类声明一个隐式的，无参的默认构造函数
 *    - Factory Constructor，工厂设计模式下的构造函数，其实只是普通函数，本身不会创造实例，而是交由函数体内部创造实例对象
 * 
 * In summary, the order of constructor execution is as follows:
 *      - initializer list
 *      - superclass’s no-arg constructor
 *      - main class’s no-arg constructor
 *      - If the superclass doesn’t have an unnamed, no-argument constructor,
 *        then you must manually call one of the constructors in the superclass.
 *        Specify the superclass constructor after a colon (:), just before the constructor body (if any).
 * 
 * 子类与父类：
 *    - Constructors aren’t inherited
 *        与其他语言不同，dart 中的子类不继承父类的构造函数；
 *        如果子类没有声明构造函数，则子类初始化时会调用 Default Constructor，而不是调用父类中的任意构造函数；
 *        若要调用父类的构造函数，需子类构造函数手动声明调用
 *    - 子类构造函数必须要调用父类的构造函数
 *        若父类有 Default Constructor，可不显式调用；
 *        若父类没有 Default Constructor，
 *            则需在 `:` 后 通过 `super()`、或 `super.[named]()` 来调用父类构造函数，
 *            `super` 语句中不能使用 `this` 来获取实例
 * 
 * 实例初始化顺序
 *    - 调用构造函数，开始创建实例
 *    - 创建实例对象
 *    - 根据实例变量的定义，预始化实例变量
 *    - 获取被调用的构造函数
 *      - 调用该构造函数的 initializer list
 *      - 若父类存在 Default Constructor，则隐式调用
 *      - 若父类不存在 Default Constructor，则调用构造函数声明的父类构造函数
 *      - 调用构造函数本体
 * 
 * Initializer List
 *    用于在 Constructor Body 执行前，根据实参初始化实例变量，
 *    在构造函数之后使用 `:` 来声明 Initializer List 逻辑，
 *        变量初始化使用赋值表达式：`variable = value`；
 *        实例变量初始化表达式中，赋值操作符的右侧操作数不能使用 `this` 来获取实例；
 * 
 * Redirecting constructors
 *    当所声明的构造函数本身不需要方法体，而是直接调用其他构造函数时，可以使用 Redirecting Constructor，
 *    使用 `:` 来声明 redirecting constructors，
 *        redirecting 语法：
 *          `this(...)`，调用 Main Constructor
 *          `this.[named](...)`，调用 Named Constructor
 * 
 * Factory constructors
 *    `factory` 
 * 
 * ---------------------------
 * 
 * Dart Constructor 用法感受总结：
 * 
 * - Dart 中的 Constructor 在真正进入方法调用前就已经先创建好实例对象了，不像 Javascript 要进入方法体执行时才创建实例
 * - 创建好对象后，会先按照实例变量声明时的赋值语句，对变量进行初始化
 * - Dart 的 Constructor 更像是对实例对象的加工器，即在已创建的实例对象上执行操作
 * - Dart Constructor 后可接 `:` 来完成三个操作：
 *      1. initializer list，实例变量初始化，`: x = 1, y = 2`，初始化表达式可允许多个
 *      2. super constructor calling，构造函数体执行前先调用父类构造函数，`super(...)`、`super.[named](...)`
 *      2. redirecting constructor，将当前构造函数的调用重定向到同类的另一个构造函数，`: this(...)`、`: this.[named](...)`
 *  
 *    上面的操作使用 `,` 相隔；
 *    initializer list 表达式可允许多个
 *    super constructor calling 与 redirecting constructor 只能同时使用一个，且各自唯一，且必须在所有操作之后（即在 initializer list 之后）
 *    
 * ---------------------------
 */

void main(List<String> args) {
  var mainConstructorPoint = Point(1, 2);
  mainConstructorPoint.printPoint();

  var fromJsonConstructorPoint =Point.fromJson({ 'x': 1, 'y': 2 });
  fromJsonConstructorPoint.printPoint();

  var mainConstructorXAxisPoint =XAxisPoint(1);
  mainConstructorXAxisPoint.printPoint();
}

class Point {
  num x, y;

  // 快捷
  Point(this.x, this.y);

  Point.fromJson(Map<String, num> json): x = json['x'], y = json['y'] {
    print('In Point.fromJson(): ($x, $y)');
  }

  Point.alongXAxis(num x): this.fromJson({ 'x': x, 'y': 0 });

  void printPoint() => print('Point vector: ($x, $y)');
}

class XAxisPoint extends Point {
  // 下面的 Main Constructor 会报错，因为 Point 没有 Default Constructor，需要子类显式调用父类的构造函数
  // XAxisPoint(this.x);

  num x;

  XAxisPoint(this.x): super(x, 0);

  XAxisPoint.fromJson(Map<String, num> json): super.fromJson(json) {

  }
}