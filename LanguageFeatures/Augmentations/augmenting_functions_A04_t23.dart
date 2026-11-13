// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - The two declarations have the same type parameters.
/// - The return type is the same as the introductory declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the introductory
///   declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type.
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`, or none of them have it.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if the return type of an
/// augmentation don't exactly match the original function. Test the case when
/// the return type is a top type.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

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
