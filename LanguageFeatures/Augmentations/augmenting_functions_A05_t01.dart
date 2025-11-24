// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmenting function specifies any default values.
///
/// @description Checks that it is a compile-time error if a function
/// augmentation specifies any default values.
/// @author sgrekhov22@gmail.com
/// @issue 55569

// SharedOptions=--enable-experiment=macros

part 'augmenting_functions_A05_t01_lib.dart';

void topLevelFunction1([int i = 1]) {}
void topLevelFunction2({int i = 1}) {}

class C {
  static void staticMethod1([int i = 1]) {}
  static void staticMethod2({int i = 1}) {}
  void instanceMethod1([int i = 1]) {}
  void instanceMethod2([covariant int i = 1]) {}
  void instanceMethod3({int i = 1}) {}
  void instanceMethod4({covariant int i = 1}) {}
}

mixin M {
  static void staticMethod1([int i = 1]) {}
  static void staticMethod2({int i = 1}) {}
  void instanceMethod1([int i = 1]) {}
  void instanceMethod2([covariant int i = 1]) {}
  void instanceMethod3({int i = 1}) {}
  void instanceMethod4({covariant int i = 1}) {}
}

enum E {
  e1;

  static void staticMethod1([int i = 1]) {}
  static void staticMethod2({int i = 1}) {}
  void instanceMethod1([int i = 1]) {}
  void instanceMethod2([covariant int i = 1]) {}
  void instanceMethod3({int i = 1}) {}
  void instanceMethod4({covariant int i = 1}) {}
}

class A {}

extension Ext on A {
  static void staticMethod1([int i = 1]) {}
  static void staticMethod2({int i = 1}) {}
  void instanceMethod1([int i = 1]) {}
  void instanceMethod2({int i = 1}) {}
}

extension type ET(int _) {
  static void staticMethod1([int i = 1]) {}
  static void staticMethod2({int i = 1}) {}
  void instanceMethod1([int i = 1]) {}
  void instanceMethod2({int i = 1}) {}
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
