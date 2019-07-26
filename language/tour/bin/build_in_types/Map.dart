/**
 * Map: key-value 集合，Map<IKeyType, IValueType>，Key 唯一
 * 
 * https://api.dart.dev/stable/2.4.0/dart-core/Map-class.html
 * 
 * Key & Value 类型
 *  - Map<dynamic, dynamic>，Key、Value 均为 dynamic，
 *      可往 Map 中添加任意类型的键、值；
 *  - Map<dynamic, IValueType>，Key 为 dynamic，Value 为指定类型，
 *      Map 中的 Key 可设为任意类型，
 *      Map 中的 Value 仅能设为指定类型，若设为其他类型，则会在 compile-time 报错
 *  - Map<IKeyType, dynamic>，Key 为指定类型，Value 为 dynamic，
 *      Map 中的 Key 仅能设为指定类型，若设为其他类型，则会在 compile-time 报错
 *      Map 中的 Value 可设为任意类型
 * 
 * 创建 Map：
 *  - Map 字面量：
 *    { 1: 'foo', 'bar': 2 }
 *      创建 Map<dynamic, dynamic>
 *    { 1: true, 'bar': false }
 *      创建 Map<dyncmic, IValueType = boolean>
 *    { 1: true, 2: 'foo' }
 *      创建 Map<IKeyType = int, dynamic>
 * 
 *  - Map 构造函数，可选地声明 Map 中的键值类型
 *    new Map(): 初始化一个 Map<dynamic, dynamic>
 *    new Map<IKeyType, IValueType>(): 初始化一个指定 Key 类型、指定 Value 类型的 Map
 * 
 * `spread operator`（...）操作符：
 *    用于解构操作符右侧操作数的 IterableMapEntries A，将 A 中的元素添加到新 Map B中，
 *    若 IterableMapEntries A 为 null，则会在 runtime 抛错误，compile-time 不会报错
 * 
 * `null-aware spread operator`（...?）操作符：
 *    用于解构操作符右侧操作数的 IterableMapEntries A，将 A 中的元素添加到新 Map B中，
 *    若 IterableMapEntries A 为 null，则不会抛错误
 * 
 * Control Flow Collections
 *    - Collection If: Map 字面量中根据 if 表达式判断是否添加对应的元素
 *        ```
 *          var nav = {
 *              1: 'foo',
 *              if (true) 2: 'bar',
 *              if (false) -2: 'baz',
 *          }
 *        ```
 * 
 *    - Collection For: Map 字面量中遍历 for 循环，计算循环中的表达式值，并逐一添加到 Map 中
 *        ```
 *          var listOfInts = [1, 2, 3];
 *          var mapOfStrings = {
 *              0: 'value: 0',
 *              for (var num in listOfInts) num: 'value: $num',
 *          }
 *        ```
 */

import 'dart:io';

main(List<String> args) {
  // Map<String, String>
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  // gifts[1] = 'bar'; Uncommenting this line causes compile-time error
  // gifts['foo'] = 1; Uncommenting this line causes compile-time error

  // Map<int, String>
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon'
  };

  stdout.write(gifts.keys.join(' '));
  stdout.writeln('');
  stdout.write(gifts.values.join(' '));

  //  初始化一个 Map<dynamic, dynamic>
  var dynamicMap = {
    'foo': 1,
    1: 'foo',
    true: null,
    false: true,
  };

  dynamicMap['bar'] = 2;
  dynamicMap.remove(1);

  dynamicMap = new Map();
  dynamicMap['foo'] = 1;
  dynamicMap[1] = 'foo';

  // 初始化一个 Map<dynamic, int>
  var dynamicKeyMap = {
    'foo': 1,
    1: 2,
    'bar': 3
  };

  dynamicKeyMap = new Map<dynamic,int>();
  dynamicKeyMap['foo'] = 1;
  dynamicKeyMap[1] = 2;
  dynamicKeyMap['bar'] = 3;

  // dynamicKeyMap[2] = 'xjj'; Uncommenting this line causes compile-time error

  // 初始化一个 Map<int, dynamic>
  var dynamicValueMap = {
    1: 'bar',
    2: 2,
    3: true
  };

  // dynamicValueMap['4'] = false;  Uncommenting this line causes compile-time error

  var nilMap;
  
  var spreadMap = {
    1: 'foo',
    ...dynamicMap,
    ...?nilMap,
  };

  stdout.writeln('');
  stdout.write(spreadMap.keys.join(' '));
  stdout.writeln('');
  stdout.write(spreadMap.values.join(' '));

  var ifAndForMap = {
    1: 'foo',
    if (true) 'biu': 2,
    for (var entry in dynamicMap.entries) entry.key: entry.value,
  };
  stdout.writeln('');
  stdout.write(ifAndForMap.keys.join(' '));
  stdout.writeln('');
  stdout.write(ifAndForMap.values.join(' '));
}