/**
 * Set：unorder(无序)、unique(唯一)
 * 
 * https://api.dart.dev/stable/2.4.0/dart-core/Set-class.html
 * 
 * Set 类型：
 *  - dyncmic 类型的 Set 可添加任意类型元素；
 *  - 指定类型的 Set 仅可添加指定类型元素，若添加其他类型，则会在 compile-time 报错
 * 
 * 创建 Set：
 * 
 *  - Set 字面量
 *    {1, 2, 3}：
 *        创建一个 int 类型的 Set，该类型是隐式推断的，
 *        且一旦创建，则不能往 Set 中添加其他类型的值
 *    {1, true, 'foo'}：
 *        创建一个 dynamic 类型的 Set，可往 Set 中添加任意类型的值
 *    <String>{}：
 *        创建一个空的 String 类型的 Set，
 *        一定要带上前缀 <String>，
 *        否则仅使用 {} 会创建出一个 <dyncmic, dynamic> 类型的 Map
 *  
 *  - Set 构造函数，可选地声明 Set 中的值类型
 *    new Set()：初始化一个 dynamic 类型的 Set
 *    new Set<String>()：初始化一个 String 类型的 Set
 * 
 *  - 创建时若 Set 类型被显式声明，则 Set 类型被确定为指定类型
 *  - 创建时若 Set 类型味显示声明，则尝试隐式推断，
 *      若能推断出唯一类型，则 Set 类型会被指定为所推断的类型
 *      若不能推断出唯一类型，则 Set 类型会被指定为 dynamic 类型
 * 
 * `spread operator`（...）操作符：
 *    用于解构操作符右侧操作数的 Iterable A，将 A 中的元素添加到新 Set B中，
 *    若 Iterable A 为 null，则会在 runtime 抛错误，compile-time 不会报错
 * 
 * `null-aware spread operator`（...?）操作符：
 *    用于解构操作符右侧操作数的 Iterable A，将 A 中的元素添加到新 Set B中，
 *    若 Iterable A 为 null，则不会抛错误
 * 
 * Control Flow Collections
 *    - Collection If: Set 字面量中根据 if 表达式判断是否添加对应的元素
 *        ```
 *          var nav = {
 *              1,
 *              if (true) 2,
 *              if (false) -2,
 *          }
 *        ```
 * 
 *    - Collection For: Set 字面量中遍历 for 循环，计算循环中的表达式值，并逐一添加到 Set 中
 *        ```
 *          var listOfInts = [1, 2, 3];
 *          var listOfStrings = {
 *              'value: 0',
 *              for (var num in listOfInts) 'value: $num',
 *          }
 *        ```
 * 
 * Set API: https://api.dart.dev/stable/2.4.0/dart-core/Set-class.html
 *    - set.length，长度
 *    - set.add(v)，添加元素 v
 *    - set.addAll(Iterable v)，把 Iterable v 中所有元素添加到 Set 中
 *    - set.remove(v)，删除 Set 中的元素 v
 *    - set.contains(v)，判断 Set 中是否含有元素 v
 *    - set.clear()，清空 Set 中的所有元素
 */

import 'dart:io';

main(List<String> args) {
  // 下面的 Set 字面量为 字符串类型 Set
  var halogens = { 'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine' };
  // halogens.add(1); Uncommenting this line causes compile-time error

  // var halogens = new Set();
  // halogens.addAll(['fluorine', 'chlorine', 'bromine', 'iodine', 'astatine']);

  var dynamicTypeSet = { 1, 'foo' };
  dynamicTypeSet.add(true);
  dynamicTypeSet.addAll({ 2, 'bar' });
  dynamicTypeSet.addAll(halogens);

  for (var item in dynamicTypeSet) {
    stdout.writeln(item);
  }

  stdout.writeln(
'''
dynamicTypeSet size: ${dynamicTypeSet.length}
'''
  );

  var nilSet;
  stdout.writeln(
    '''
\nsperator `...` & `...?`:'''
    );
  for (var item in {
    -1,
    false,
    ...dynamicTypeSet,
    ...?nilSet,
  }) {
    stdout.writeln(item);
  }
  
  var nav = {
    1,
    if (true) 2,
    if (false) -2,
  };

  stdout.writeln(
    '\nCollection If'
  );
  for (var item in nav) stdout.writeln(item);

  var listOfInts = [1,2,3];
  var setOfStrings = {
    'value: 0',
    for (var num in listOfInts) 'value: $num',
  };

  stdout.writeln(
    '\nCollection For-In'
  );
  for (var item in setOfStrings) stdout.writeln(item);
}