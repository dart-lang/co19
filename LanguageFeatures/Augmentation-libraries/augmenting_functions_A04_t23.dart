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
/// @description Checks that it is a compile-time error if type of parameters of
/// an augmentation doesn't exactly match the original function. Test the case
/// when return type is a top type.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

part 'augmenting_functions_A04_t23_lib1.dart';
part 'augmenting_functions_A04_t23_lib2.dart';

Object? topLevelFunction1() => 0;
dynamic topLevelFunction2() => 0;
void topLevelFunction3() => 0;

class C {
  static Object? staticMethod1() => 0;
  static dynamic staticMethod2() => 0;
  static void staticMethod3() => 0;
  Object? instanceMethod1() => 0;
  dynamic instanceMethod2() => 0;
  void instanceMethod3() => 0;
}

mixin M {
  static Object? staticMethod1() => 0;
  static dynamic staticMethod2() => 0;
  static void staticMethod3() => 0;
  Object? instanceMethod1() => 0;
  dynamic instanceMethod2() => 0;
  void instanceMethod3() => 0;
}

enum E {
  e1;

  static Object? staticMethod1() => 0;
  static dynamic staticMethod2() => 0;
  static void staticMethod3() => 0;
  Object? instanceMethod1() => 0;
  dynamic instanceMethod2() => 0;
  void instanceMethod3() => 0;
}

class A {}

extension Ext on A {
  static Object? staticMethod1() => 0;
  static dynamic staticMethod2() => 0;
  static void staticMethod3() => 0;
  Object? instanceMethod1() => 0;
  dynamic instanceMethod2() => 0;
  void instanceMethod3() => 0;
}

extension type ET(int _) {
  static Object? staticMethod1() => 0;
  static dynamic staticMethod2() => 0;
  static void staticMethod3() => 0;
  Object? instanceMethod1() => 0;
  dynamic instanceMethod2() => 0;
  void instanceMethod3() => 0;
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(topLevelFunction3);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
