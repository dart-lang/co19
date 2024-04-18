// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the function augmentation does not exactly match the
///   original function. This means the return types must be the same; there
///   must be the same number of positional, optional, and named parameters; the
///   types of corresponding positional and optional parameters must be the
///   same; the names and types of named parameters must be the same; any type
///   parameters and bounds must be the same; and any required or covariant
///   modifiers must match.
///
/// @description Checks that it is a compile-time error if type of positional
/// parameters of an augmentation doesn't exactly match the original function
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A04_t07_lib.dart';

void topLevelFunction1(int i) {}
void topLevelFunction2(Object o) {}
void topLevelFunction3(String s) {}
void topLevelFunction4<T extends String>(T t) {}
void topLevelFunction5<T extends String>(String t) {}

class C {
  static void staticMethod1(int i) {}
  static void staticMethod2(Object o) {}
  static void staticMethod3(String s) {}
  static void staticMethod4<T extends String>(T t) {}
  static void staticMethod5<T extends String>(String t) {}
  void instanceMethod1(int i) {}
  void instanceMethod2(Object o) {}
  void instanceMethod3(String s) {}
  void instanceMethod4<T extends String>(T t) {}
  void instanceMethod5<T extends String>(String t) {}
}

mixin M {
  static void staticMethod1(int i) {}
  static void staticMethod2(Object o) {}
  static void staticMethod3(String s) {}
  static void staticMethod4<T extends String>(T t) {}
  static void staticMethod5<T extends String>(String t) {}
  void instanceMethod1(int i) {}
  void instanceMethod2(Object o) {}
  void instanceMethod3(String s) {}
  void instanceMethod4<T extends String>(T t) {}
  void instanceMethod5<T extends String>(String t) {}
}

enum E {
  e1;

  static void staticMethod1(int i) {}
  static void staticMethod2(Object o) {}
  static void staticMethod3(String s) {}
  static void staticMethod4<T extends String>(T t) {}
  static void staticMethod5<T extends String>(String t) {}
  void instanceMethod1(int i) {}
  void instanceMethod2(Object o) {}
  void instanceMethod3(String s) {}
  void instanceMethod4<T extends String>(T t) {}
  void instanceMethod5<T extends String>(String t) {}
}

class A {}

extension Ext on A {
  static void staticMethod1(int i) {}
  static void staticMethod2(Object o) {}
  static void staticMethod3(String s) {}
  static void staticMethod4<T extends String>(T t) {}
  static void staticMethod5<T extends String>(String t) {}
  void instanceMethod1(int i) {}
  void instanceMethod2(Object o) {}
  void instanceMethod3(String s) {}
  void instanceMethod4<T extends String>(T t) {}
  void instanceMethod5<T extends String>(String t) {}
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(topLevelFunction3);
  print(topLevelFunction4);
  print(topLevelFunction5);
  print(C);
  print(M);
  print(E);
  print(A);
}
