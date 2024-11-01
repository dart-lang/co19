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
/// @description Checks that it is not an error to declare an asynchronous
/// function with return type `T`, with a short syntax and `flatten(T)` is
/// `void`.
/// @author sgrekhov22@qmail.com

import 'dart:async';

void f1() async => 1;
void f2() async => null;
void f3<T>(T t) async => t;
void f4() async => print(""); // print("") returns void

Future<void> f5() async => 1;
Future<void> f6() async => null;
Future<void> f7<T>(T t) async => t;
Future<void> f8() async => print("");

FutureOr<void> f9() async => 1;
FutureOr<void> f10() async => null;
FutureOr<void> f11<T>(T t) async => t;
FutureOr<void> f12() async => print("");

main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
  print(f6);
  print(f7);
  print(f8);
  print(f9);
  print(f10);
  print(f11);
  print(f12);
}
