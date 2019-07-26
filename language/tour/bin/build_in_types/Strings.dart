/**
 * Dart 的 String 类型是 utf-16 code units 序列，与 Javascript 一样
 * 
 * 初始化字符串类型值：
 *  - 单引号、双引号均可用于初始化字符串类型值，该模式字符串支持字符串插值；
 *  - 三引号 `'''`、`"""` 可用于创建多行字符串，即此时换行符会被保留；
 *  - 使用 `r` 作为前缀可创建纯字符串值，此时不支持字符串插值
 * 
 * 字符串插值：
 *  - 字符串中可使用 `${expression}` 来进行表达式插值；
 *  - 字符串中可使用 `$identifier` 来进行变量插值，若 identifier 不是字符串类型，则会调用其 `toString()` 来获取字符串表示；
 * 
 * 操作符：
 *   - “==” 可用于判断 String 类型值是否相等；
 *   - “+” 可用于拼接 String；
 * 
 * Compile-time Constant：
 *  - 字符串字面量是 Compile-time Constant；
 *  - 字符串插值中的表达式或 identifier 若均为 Compile-time constants，
 *    比如 null、numeric、string、boolean，
 *    则该字符串值亦为 Compile-time Constant；
 * 
 */

import 'dart:io';

main(List<String> args) {
  var name = 'foo bar';
  
  var s = 'single quotes';
  stdout.writeln(s);

  s = "double quotes";
  stdout.writeln(s);
  
  s = "string interpolation with expression: ${name}";
  stdout.writeln(s);

  s = 'string interpolation with identifier: $s';
  stdout.writeln(s);

  s = '''
  multi line string with interpolation: ${name}''';
  stdout.writeln(s);

  s = r'raw string with single quotes, which do not support interpolation: ${name}';
  stdout.writeln(s);

  s = r'raw string with double quotes, which do not support interpolation: ${name}';
  stdout.writeln(s);

  s = r'''raw string in multi line mode,
    which do not support interpolation: ${name}
    ''';
  stdout.writeln(s);

  stdout.close();
}