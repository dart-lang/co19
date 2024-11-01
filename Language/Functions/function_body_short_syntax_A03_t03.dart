// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function body is either:
/// ...
/// - of the form `=> e` or the form `async => e`, which both return the value
///   of the expression `e` as if by a `return e`. ...  Let `T` be the declared
///   return type of the function that has this body. It is a compile-time error
///   if one of the following conditions hold:
///   – The function is synchronous, `T` is not `void`, and it would have been a
///     compile-time error to declare the function with the body `{ return e; }`
///     rather than `=> e`.
///
/// @description Checks that it is not an error to declare a synchronous method
/// with a short syntax and the return type `void`.
/// @author sgrekhov22@qmail.com

class C {
  static void staticMethod() => 1;
  void instanceMethod() => 1;
}

mixin M {
  static void staticMethod() => null;
  void instanceMethod() => null;
}

enum E {
  e0;
  static void staticMethod<T>(T t) => t;
  void instanceMethod<T>(T t) => t;
}

class A {}

extension Ext on A {
  static void staticMethod() => print("");
  void instanceMethod() => print("");
}

extension type ET(int _) {
  static void staticMethod<T extends num>(T t) => t;
  void instanceMethod<T extends num>(T t) => t;
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
