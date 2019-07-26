/**
 * Functions
 * 
 * 变量作用域
 *    - 每个大括号（curly braces） 创建独立的变量作用域
 *    - 作用域栈中，变量可访问性从里到外，内部作用域可以访问外部作用域变量，反之不行
 * 
 * 函数签名
 *    - 常规签名：
 *        ```
 *          [type] doSomething([type] arg1, [type] arg2) {
 *          }
 *        ```
 *    - 箭头函数签名，当函数体只有一条语句时即可使用箭头函数：
 *        ```
 *          [type] doSomething([type] arg1, [type] arg2) => statement;
 *        ```
 * 
 * Optional Parameters（可选参数）：
 *    dart 中可选参数有两种类型：Optional Named Parameters、Optional Positional Parameters；
 *    在一个函数声明中，只允许声明一个可选参数体，且只能置于参数列表最后；
 *    在函数调用中，可选参数的实参也放在非可选参数之后，无论是 named 还是 positional；
 * 
 *    - Optional Named Parameters
 *      - 声明语法：`void doSomething({[type] arg1, [type] arg2}) {...}`
 *      - 实参调用语法：`doSomething(arg1: val1, arg2: val2);`
 *      - optional named parameters 中的每个参数默认均为可选，
 *        除非使用 `meta` 包中的 `@requried` 修饰符显式声明参数是必选的
 * 
 *    - Optional Positional Parameters
 *      - 声明语法：`void doSomething([ [type] arg1, [type] arg2] ) {...}`
 *      - 实参调用语法：`doSomething(val1, val2);`，调用时按顺序传递
 *      - optional named parameters 中的每个参数均为可选
 * 
 * Default Parameter Values（可选参数的默认值）
 *    - 只有 Optional Parameters 才支持默认值
 *    - 声明语法：
 *        `void doSomething({[type] arg1 = def1, [type] arg2}) {...}`
 *        `void doSomething([[type] arg1 = def1, [type] arg2]) {...}`
 *    - 参数的默认值必须为 compile-time value
 */

import 'package:meta/meta.dart';

void main(List<String> args) {
  _arrorTest();

  _optionalNamed(1, 2, var4: 4);
  _optionalPosition(1, 2, 3,);
}

const abc = {
  1,
  2,
  3,
  4,
  5
};

void _arrorTest() => print('arrowTest');

void _optionalNamed(int var1, int var2, { int var3, @required int var4, Set<int> var5 = abc, Set<int> var6 = const {
  1,
  2,
  4,
  5,
  6,
} }) {
  print({var1, var2, var3, var4, var5, var6});
}

void _optionalPosition(int var1, int var2, [int var3 = 33, int var4]) {
  print({var1, var2, var3, var4});
}