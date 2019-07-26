/**
 * Dart 支持两种类型的数值变量：int、double，这两种类型均为 num 类型的子类
 * 
 * int:
 *    - 针对常规的 Dart Vm，int 占用 64bits；
 *    - 当针对 javascript 环境时，int 占用 54bits；
 *    - int 类型支持位运算：<<、>>、&、|；
 * 
 * double:
 *    - double 类型数值统一占用 64bits；
 * 
 * Literal numbers are compile-time constants:
 *    - 数值字面量均为 compile-time constants；
 *    - 当表达式中的操作数均为数值字面量或均为 compile-time constants 时，整个表达式都会变为 compile-time constants；
 * 
 * 注意：
 *    - int 类型变量不能显式转为 double 类型；
 *        ```
 *            var x = 1;
 *            double y = x;  // throw Error;
 *        ```
 *    - double 类型变量不能显式转为 int 类型；
 *        ```
 *            var x = 1.1;
 *            int y = x;  // throw Error;
 *        ```
 *     - int 类型值可隐式转为 double 类型；
 *        ```
 *            double y = 1;  // Equivalent to double y = 1.0
 *        ```
 *    
 */

main() {
}