// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function body is either:
/// ...
/// - of the form `=> e` or the form `async => e`, which both return the value
///   of the expression `e` as if by a `return e`. ...  Let `T` be the declared
///   return type of the function that has this body. It is a compile-time error
///   if one of the following conditions hold:
///   ...
///   – The function is asynchronous, `flatten(T)` is not `void`, and it would
///     have been a compile-time error to declare the function with the body
///     `async { return e; }` rather than `async => e`.
///
/// @description Checks that it is a compile-time error to declare an
/// asynchronous function with a short syntax and an incompatible return type.
/// @author sgrekhov22@qmail.com

import 'dart:async';

Future<String> f1() async => 1;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
Future<int> f2() async => null;
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
Future<String> f3<T>(T t) async => t;
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

FutureOr<String> f4() async => 1;
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
FutureOr<int> f5() async => null;
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
FutureOr<int> f6<T>(T t) async => t;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
  print(f6);
}
