# Dart Future

Future 详细的使用文档参考：

- 讲解得最详细的：[Futures and error handling](https://dart.dev/guides/libraries/futures-error-handling)
- [Future<T> class](https://api.dart.dev/stable/2.4.0/dart-async/Future-class.html)
- [dart:async - asynchronous programming](https://dart.dev/guides/libraries/library-tour#dartasync---asynchronous-programming)

类似于 Javascript 的 Promise

## API

### Constructors

####  `Future`

`Future(FutureOr<T> computation())`

> Creates a future containing the result of calling computation asynchronously with Timer.run. [...]

使用 `Timer.run` 来创建异步函数调用，并将函数调用结果来 complete 当前 future。

#### `Future.delayed`

`Future.delayed(Duration duration, [ FutureOr<T> computation() ])`

> Creates a future that runs its computation after a delay. [...]

延迟指定时间后创建异步函数调用，并将函数调用结果来 complete 当前 future。

#### `Future.microtask`

`Future.microtask(FutureOr<T> computation())`

> Creates a future containing the result of calling computation asynchronously with scheduleMicrotask. [...]

使用 scheduleMicrotask 来创建异步函数调用，并将函数调用结果来 complete 当前 future。

#### `Future.sync`

`Future.sync(FutureOr<T> computation())`

> Returns a future containing the result of immediately calling computation. [...]

马上调用函数，并将函数调用结果来 complete 当前 future。

#### `Future.value`

`Future.value([FutureOr<T> value ])`

> Creates a future completed with value. [...]

使用实参的值来 complete 当前 future

#### `Future.error`

使用实参的 error 来 complete 当前 future。

### Methods

#### `then`

`then<R>(FutureOr<R> onValue(T value), { Function onError }) → Future<R>`

> Register callbacks to be called when this future completes. [...]

创建 future，并当父 future 无报错时调用 onValue 函数，并将该函数的返回值来 complete future。

如果没有传递 onError，则当父 future 报错时，会以该 error 来 complete future。

#### `catchError`

`catchError(Function onError, { bool test(Object error) }) → Future<T>`

> Handles errors emitted by this Future. [...]

创建 future，并当父 future 无报错时，onError 回调不会被调用，并将父 future 返回值来 complete future。

当声明 test 函数时，则会当父 future 报错且 test 函数返回 true 才会调用 onError 回调，否则会把父 future 返回的错误来 complete future。

#### `whenComplete`

`whenComplete(FutureOr action()) → Future<T>`

> Registers a function to be called when this future completes. [...]

创建 future，当父 future complete 时调用 action，无论 complete 的结果是否时错误值，并将 action 函数返回值来 complete future。

### Static Methods

#### `any`

`any<T>(Iterable<Future<T>> futures) → Future<T>`

> Returns the result of the first future in futures to complete. [...]

创建 future，并将 futures 中第一个 complete 的 future 的值来 complete future。

类似于 `Promise.race(Promise[])`。

#### `forEach`

`forEach<T>(Iterable<T> elements, FutureOr action(T element)) → Future`

> Performs an action for each element of the iterable, in turn. [...]

#### `wait`

`wait<T>(Iterable<Future<T>> futures, { bool eagerError: false, void cleanUp(T successValue) }) → Future<List<T>>`

> Waits for multiple futures to complete and collects their results. [...]

创建 future，当 futures 均 complete 后，将返回值合并为数组来 complete future。

类似于 `Promsie.all(Promise[])`。

## async try-catch-finally like

回顾 future 的三个 chaining 函数 api：`then()`、`catchError`、`whenComplete`，这三个函数的工作方式跟 `try-cache-finally` 是完全一样的，考虑以下代码：

```dart
createFuture()
  .then()
  .then()
  .catchError(() => {}, error => error is NoSuchMethodError)
  .then()
  .whenComplete()
  .then()
  .catchError();
```

上面的 chaining 等价于：

```dart
() async => {
  future f;
  
  try {
    try {
      try {
        f = await createFuture();
        f = await f;
        f = await f;
      } on NoSuchMethodError(e) {
        ...
      }

      await f;
    } finally {

    }
  } catch(e) {
    
  }
}
```

## Potential problem

### failing to register error handlers early

[failing to register error handlers early](https://dart.dev/guides/libraries/futures-error-handling#potential-problem-failing-to-register-error-handlers-earl)

### accidentally mixing synchronous and asynchronous errors

[accidentally mixing synchronous and asynchronous errors](https://dart.dev/guides/libraries/futures-error-handling#potential-problem-accidentally-mixing-synchronous-and-asynchronous-errors)

