// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The function augmentation specifies any default values.
///
/// @description Checks that it is a compile-time error if a function
/// augmentation specifies any default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A05_t02_lib.dart';

void topLevelFunction1([int? i]) {}
void topLevelFunction2({int? i}) {}
void topLevelFunction3({required int? i}) {}

class C {
  static void staticMethod1([int? i]) {}
  static void staticMethod2({int? i}) {}
  static void staticMethod3({required int? i}) {}
  void instanceMethod1([int? i]) {}
  void instanceMethod2([covariant int? i]) {}
  void instanceMethod3({int? i}) {}
  void instanceMethod4({covariant int? i}) {}
  void instanceMethod5({required int? i}) {}
}

mixin M {
  static void staticMethod1([int? i]) {}
  static void staticMethod2({int? i}) {}
  static void staticMethod3({required int? i}) {}
  void instanceMethod1([int? i]) {}
  void instanceMethod2([covariant int? i]) {}
  void instanceMethod3({int? i}) {}
  void instanceMethod4({covariant int? i}) {}
  void instanceMethod5({required int? i}) {}
}

enum E {
  e1;

  static void staticMethod1([int? i]) {}
  static void staticMethod2({int? i}) {}
  static void staticMethod3({required int? i}) {}
  void instanceMethod1([int? i]) {}
  void instanceMethod2([covariant int? i]) {}
  void instanceMethod3({int? i}) {}
  void instanceMethod4({covariant int? i}) {}
  void instanceMethod5({required int? i}) {}
}

class A {}

extension Ext on A {
  static void staticMethod1([int? i]) {}
  static void staticMethod2({int? i}) {}
  static void staticMethod3({required int? i}) {}
  void instanceMethod1([int? i]) {}
  void instanceMethod2({int? i}) {}
  void instanceMethod3({required int? i}) {}
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(C);
  print(M);
  print(E);
  print(A);
}
