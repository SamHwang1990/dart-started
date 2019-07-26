/**
 * 布尔值
 * 
 * 可选值：
 *    - true
 *    - false
 * 
 * if(expression) 判断
 *    - expression 值仅支持 true 或 false；
 *    - 不支持 nonbooleanValue，比如 0、1、null，
 *      这在 Javascript 中是允许的，因为 JS 中会默认加上 `!!` 将表达式强行转为 Boolean Value
 * 
 * assert(expression) 判断
 *    - expression 值仅支持 true 或 false；
 *    - 不支持 nonbooleanValue，比如 0、1、null
 *      这在 Javascript 中是允许的，因为 JS 中会默认加上 `!!` 将表达式强行转为 Boolean Value
 * 
 * 即，使用上不允许：
 * ```
 * var a = 1;
 * if (a) { ... }
 * ```
 * 
 * 只允许：
 * ```
 * var a = 1;
 * if (a == 1) { ... }
 * ```
 */

main(List<String> args) {
  
}