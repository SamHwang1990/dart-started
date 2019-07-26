/**
 * Runes 为 UTF-32 code points 序列的字符串
 * 
 * String 为 UTF-16 code points 序列的字符串
 * 
 * 因此，Runes 几乎能表示所有 Unicode 平面字符，String 只能表示基础平面的字符
 * 
 * 在字符串中可用 '\uxxxx' 来表示基础平面字符，'\u{xxxxx}' 来表示 Rune 字符单元，
 * 其中 xxxxx 为 Unicode Code Point
 * 
 * `String.codeUnits`：codeUnits 属性用于获取字符串的 UTF-16 code unit 序列
 * `String.codeUnitAt(index)`：codeUnitAt(index) 方法用于获取字符串的 UTF-16 code unit 序列中指定索引的 code unit
 * `String.runes`：runes 属性用于获取字符串的 UTF-32 rune 序列
 * 
 * dart 中近乎适合地翻转字符串方式：new String.fromCharCodes(input.runes.toList().reversed)
 *    https://stackoverflow.com/questions/21521729/how-do-i-reverse-a-string-in-dart
 * 
 *    即，应该在 runes 序列上 reverse，而不是在 string 本身 reverse
 */

main(List<String> args) {
  var clapping = '\u{1f44f}';

  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
    '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}'
  );

  print(new String.fromCharCodes(input));
}