/**
 * List，列表类型，又称数组
 * 
 * `Fixed-length list` vs `Growable list`
 *  - `Fixed-length list` 为定长列表，一旦初始化，不再允许修改，
 *        若尝试修改，会在 runtime 抛错误，compile-time 不会报错
 *  - `Growable list` 为不定长列表，初始化后，可以通过 add、remove、length setter 等方式设置其长度
 * 
 * 创建数组：
 *  - `Fixed-length list`：使用 List 构造函数，并指定数组长度
 *        `List<int> fixedLengthList = new List(5);`；
 *  - `Growable list`：使用`[]` 字面量或List 构造函数不指定长度
 *        `List<int> growableList = [];`
 *        `List<int> growableList = new List();`
 * 
 * `spread operator`（...）操作符：
 *    用于解构操作符右侧操作数的 Iterable A，将数组元素添加到新数组 B中，
 *    若 Iterable A 为 null，则会在 runtime 抛错误，compile-time 不会报错
 * 
 * `null-aware spread operator`（...?）操作符：
 *    用于解构操作符右侧操作数的 Iterable A，将数组元素添加到新数组 B中，
 *    若 Iterable A 为 null，则不会抛错误
 * 
 * 数组长度：
 *    - list.length
 * 
 * Control Flow Collections
 *    - Collection If: 数组字面量中根据 if 表达式判断是否添加对应的元素
 *        ```
 *          var nav = [
 *              1,
 *              if (true) 2,
 *              if (false) -2,
 *          ]
 *        ```
 * 
 *    - Collection For: 数组字面量中遍历 for 循环，计算循环中的表达式值，并逐一添加到数组中
 *        ```
 *          var listOfInts = [1, 2, 3];
 *          var listOfStrings = [
 *              'value: 0',
 *              for (var num in listOfInts) 'value: $num',
 *          ]
 *        ```
 * 
 * List API: https://api.dart.dev/stable/2.4.0/dart-core/List-class.html
 */

import 'dart:io';

main(List<String> args) {
  List<int> fixedLengthList = new List(5);

  // Throw Runtime Error: Unsupported operation: Cannot add to a fixed-length list
  // fixedLengthList.add(1);
  
  // Throw Runtime Error: Unsupported operation: Cannot change the length of a fixed-length list
  // fixedLengthList.length = 6;

  List<int> intList = [1, 2, 3];
  List<int> unInitializedIntList;

  List<int> spreadOperatorList = [...intList];

  // Throw Runtime Error: NoSuchMethodError: The getter 'iterator' was called on null.
  // spreadOperatorList.addAll([...unInitializedIntList]);

  List<int> nullAwareSpreadOperatorList = [...?unInitializedIntList];
  nullAwareSpreadOperatorList.addAll([...?unInitializedIntList]);

  var nav = [
    1,
    if (true) 2,
  ];

  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    'value: 0',
    for (var num in listOfInts) 'value: $num',
  ];


  stdout.writeln(nav);
  stdout.writeln(listOfStrings);

  stdout.writeln(listOfStrings.length);
}