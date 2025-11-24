// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The function signature of the augmenting function does not exactly match
///   the function signature of the augmented function. This means that any
///   provided return types must be the same type; there must be same number or
///   required and optional positional parameters, all with the same types (when
///   provided), the same number of named parameters, each pairwise with the
///   same name, same type (when provided) and same `required` and `covariant`
///   modifiers, and any type parameters and their bounds (when provided) must
///   be the same (like for type declarations).
///
/// @description Checks that it is a compile-time error if number of positional
/// parameters of an augmentation doesn't exactly match the original function.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

part 'augmenting_functions_A04_t02_lib.dart';

void topLevelFunction1() {}

void topLevelFunction2(int i) {}

void topLevelFunction3(Object o1, Object o2) {}

void topLevelFunction4(Object o1, Object o2) {}

class C {
  static void staticMethod1() {}
  static void staticMethod2(int i) {}
  static void staticMethod3(Object o1, Object o2) {}
  static void staticMethod4(Object o1, Object o2) {}
  void instanceMethod1() {}
  void instanceMethod2(int i) {}
  void instanceMethod3(Object o1, Object o2) {}
  void instanceMethod4(Object o1, Object o2) {}
}

mixin M {
  static void staticMethod1() {}
  static void staticMethod2(int i) {}
  static void staticMethod3(Object o1, Object o2) {}
  static void staticMethod4(Object o1, Object o2) {}
  void instanceMethod1() {}
  void instanceMethod2(int i) {}
  void instanceMethod3(Object o1, Object o2) {}
  void instanceMethod4(Object o1, Object o2) {}
}

enum E {
  e1;

  static void staticMethod1() {}
  static void staticMethod2(int i) {}
  static void staticMethod3(Object o1, Object o2) {}
  static void staticMethod4(Object o1, Object o2) {}
  void instanceMethod1() {}
  void instanceMethod2(int i) {}
  void instanceMethod3(Object o1, Object o2) {}
  void instanceMethod4(Object o1, Object o2) {}
}

class A {}

extension Ext on A {
  static void staticMethod1() {}
  static void staticMethod2(int i) {}
  static void staticMethod3(Object o1, Object o2) {}
  static void staticMethod4(Object o1, Object o2) {}
  void instanceMethod1() {}
  void instanceMethod2(int i) {}
  void instanceMethod3(Object o1, Object o2) {}
  void instanceMethod4(Object o1, Object o2) {}
}

extension type ET(int _) {
  static void staticMethod1() {}
  static void staticMethod2(int i) {}
  static void staticMethod3(Object o1, Object o2) {}
  static void staticMethod4(Object o1, Object o2) {}
  void instanceMethod1() {}
  void instanceMethod2(int i) {}
  void instanceMethod3(Object o1, Object o2) {}
  void instanceMethod4(Object o1, Object o2) {}
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(topLevelFunction3);
  print(topLevelFunction4);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
