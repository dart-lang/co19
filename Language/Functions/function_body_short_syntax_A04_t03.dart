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
/// method with return type `T`, with a short syntax and `flatten(T)` is `void`.
/// @author sgrekhov22@qmail.com

import 'dart:async';

class C {
  static void staticMethod() async => 1;
  void instanceMethod() async => 1;
}

mixin M {
  static void staticMethod() async => null;
  void instanceMethod() async => null;
}

enum E {
  e0;
  static void staticMethod<T>(T t) async => t;
  void instanceMethod<T>(T t) async => t;
}

class A {}

extension Ext on A {
  static void staticMethod() async => print("");
  void instanceMethod() async => print("");
}

extension type ET(int _) {
  static void staticMethod<T extends num>(T t) async => t;
  void instanceMethod<T extends num>(T t) async => t;
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
