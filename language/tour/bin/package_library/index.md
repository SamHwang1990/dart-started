# Dart Package & Library

## 相关文档
- package 中的相关名词意义：[Glossary of package terms](https://dart.dev/tools/pub/glossary)
- 创建 package 的简单描述，用来强化 `lib/src` 概念即可：[Creating packages](https://dart.dev/guides/libraries/create-library-packages)
- package 目录结构，非常详细：[Package layout conventions](https://dart.dev/tools/pub/package-layout)
- package 下的依赖类型：[Package dependencies](https://dart.dev/tools/pub/dependencies)
- pub 依赖解析概述：[Package versioning](https://dart.dev/tools/pub/versioning)
- pub 依赖解析概述：[PubGrub: Next-Generation Version Solving](https://medium.com/@nex3/pubgrub-2fb6470504f)

## 重要名词

- Library，理解为 package 中对外可访问的文件即可（可 import 的文件），一个 package 可以有多个 Library；
- EntryPoint，拥有 main 入口函数的文件；
- Immediate dependency，在 pubspec 中声明的依赖；
- Transitive dependency，可以直接为间接依赖，没在 pubspec 中声明，但被 pubspec 中的 depencency 所间接依赖；

## Package 的核心目录结构

```
root directory
		|_ lib/
			|_ libraryA.dart
			|_ libraryB.dart
			|_ src/
					|_ sourceA.dart
					|_ sourceB.dart
		|_ bin/
			|_ scriptA.dart
		|_ pubspec.yaml
```

### `pubspec.yaml`

该文件用于描述 package 的元信息，类似于 npm 的 `package.json`。

该文件下，pub 默认支持的属性参见：[The pubspec file](https://dart.dev/tools/pub/pubspec)。

- `publish_to `：可选，用于指定 package 发布的路径，默认是 PubHub。若该 package 不希望 publish，可调整为 `publish_to: none`；
- `dependencies`：项目依赖声明，类似于 `package.json` 的 `dependencies`；
- `dev_dependencies`：项目开发环境依赖声明，类似于 `package.json` 的 `devDependencies`；
- `dependency_overrides`：

### `bin/` 目录

放置 Package 中 public（公开可访问的）的 EntryPoint，目录下 EntryPoint 都要拥有 main 入口函数

### `lib/` 目录

#### `lib/src` 目录

该目录下的文件属于 Package 逻辑源码，性质是 privite，即只有 package 内部可以访问，外部 package 是不能引用的。

#### 其他目录

除去 `src ` 目录，`lib` 目录下的其他文件均属于当前 Package 的 Libraries，每个文件都是一个 Libraries。

Library 是 Package 对外可访问的资源。**Library 文件不能包含 main 函数，即不能是 EntryPoint，否则，该文件会 Import 失败。**

综上可知，`src` 目录是放置  package 主逻辑的私有地方，而 src 中的内容若需要开放到其他 package，需要通过 Library 暴露。

**Library 文件不一定要用 `Lirary` 关键字声明**，参见：

> **Note:** When the `library` directive isn’t specified, a unique tag is generated for each library based on its path and filename. Therefore, we suggest that you omit the `library` directive from your code unless you plan to [generate library-level documentation](https://dart.dev/guides/libraries/create-library-packages#documenting-a-library).
>
> from: https://dart.dev/guides/libraries/create-library-packages#what-makes-a-library-package

举个例子，上面目录结构图中，若 package 要暴露 `lib/src/sourceA.dart` 中的 api，需要修改 `lib/libraryA.dart`文件：

```dart
export './src/sourceA.dart'; 
```

## Package 下完整的目录结构

> 参见：[Package layout conventions](https://dart.dev/tools/pub/package-layout)

```
enchilada/
  .dart_tool/ *
  .packages *
  pubspec.yaml
  pubspec.lock **
  LICENSE
  README.md
  CHANGELOG.md
  benchmark/
    make_lunch.dart
  bin/
    enchilada
  doc/
    api/ ***
    getting_started.md
  example/
    main.dart
  lib/
    enchilada.dart
    tortilla.dart
    guacamole.css
    src/
      beans.dart
      queso.dart
  test/
    enchilada_test.dart
    tortilla_test.dart
  tool/
    generate_docs.dart
  web/
    index.html
    main.dart
    style.css
```

### Public 的资源

- `pubspec.yaml`，package 的元信息；
- `bin/`，公开的 EntryPoints；
- `doc/`，package API 文档
- `lib/[!src]`，公开的 Libraries 文件；
- `test/`，package 的测试用例；
- `benchmark/`，package 的性能测试用例；
- `example/`，package 的使用例子；
- `web/`，web-package 的 EntryPoint；

### Private 的资源

- `lib/src/`，package 中 api 的实现地方，该目录只有 `lib/` 目录下的资源才允许访问；
- `tool/`，内部工具，不对外可见；

## Import 用例细分

考虑以下两个 Package：

```
PackageA/
	|- lib/
			|- libA1.dart
			|- libA2.dart
			|- src/
					|- moduleA1.dart
					|- moduleA2.dart
					
PackageB/
	|- lib/
			|- libB1.dart
			|- libB2.dart
			|- src/
					|- moduleB1.dart
					|- moduleB2.dart
```

### 同 package 内，src/ 内部引用

#### 使用相对路径引用：

```dart
// Module: PackageA/lib/src/moduleA1.dart

import './moduleA2.dart';	
```

#### ` package:` 引用

使用 `package:` 作为前缀，指定 package name

```dart
// Module: PackageA/lib/src/moduleA2.dart

// 注意，不需要 `lib`
import 'package:PackageA/src/moduleA1.dart'
```

### 同 package 内，src/ 模块引用 library

#### 使用相对路径引用：

```dart
// Module: PackageA/lib/src/moduleA1.dart

import '../libA2.dart';	
```

#### ` package:` 引用

使用 `package:` 作为前缀，指定 package name

```dart
// Module: PackageA/lib/src/moduleA2.dart

// 注意，不需要 `lib`
import 'package:PackageA/libA1.dart';
```

###同 package 内，library 引用 src/ 模块

#### 使用相对路径引用：

```dart
// Library: PackageA/lib/libA1.dart

import './src/moduleA1.dart';	
```

#### ` package:` 引用

使用 `package:` 作为前缀，指定 package name

```dart
// Library: PackageA/lib/libA2.dart

// 注意，不需要 `lib`
import 'package:PackageA/src/moduleA1.dart';
```

###跨 package，library 引用 library

```dart
// Library: PackageA/lib/libA1.dart

import 'package:PackageB/libB2.dart';
```

## Export 用例

考虑下面的 Package：

```
PackageA/
	|- lib/
			|- libA1.dart
			|- libA2.dart
			|- src/
					|- moduleA1.dart
					|- moduleA2.dart
```

```dart
// Library: PackageA/lib/libA1.dart

export './src/moduleA1.dart';
```

## Dependency 版本选择

在 pub 中，当出现 Shared Dependency 版本依赖出现不一致时的做法：尝试解析 package  dependency graph 中，对 shared dependency 的依赖范围，如果依赖范围闭合，则在区间内选择最符合要求的版本下载并使用，若依赖范围不闭合，会出错。

详情查看：pub 依赖解析概述：[Package versioning](https://dart.dev/tools/pub/versioning)