/**
 *  - for loop 变量作用域
 *      每个大括号都产生独立的变量作用域，是个完整的闭包，不会共享遍历的值或 index，不像 javascript
 *  - switch-case 允许空 case
 * 
 *  - switch-case 不允许非空case 中省略 break，除非 continue 到另外的 case，进而达到 fall-through
 * 
 *  - 开启 dev 的场景，并进而开启 assert
 *      - Flutter enables assertions in debug mode.
 *      - Development-only tools such as dartdevc typically enable assertions by default.
 *      - Some tools, such as dart and dart2js, support assertions through a command-line flag: --enable-asserts.
 */

main(List<String> args) {
  var intList = [ 1, 2, 3, 4 ];
  var cbList = [];

  for (var i in intList) {
    cbList.add(() => i);
  }

  for (var cb in cbList) {
    print(cb());
  }

  var v = 1;
  switch (v) {
    case 1:
      print(1);
      continue two;
    two:
    case 2:
      print(2);
      break;
    default:
      print('default $v');
  }
}