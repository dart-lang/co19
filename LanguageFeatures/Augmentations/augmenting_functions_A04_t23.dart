// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional and optional parameters as the
///   augmented declaration.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For all corresponding pairs of parameters:
///   - They have the same type (if not omitted in the augmenting declaration).
///   - They have the same `required` and `covariant` modifiers.
/// - For all positional parameters:
///   - The augmenting function's parameter name is `_`, or
///   - The augmenting function's parameter name is the same as the name of the
///     corresponding positional parameter in every preceding declaration that
///     doesn't have `_` as its name.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if type of parameters of
/// an augmentation doesn't exactly match the original function. Test the case
/// when return type is a top type.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=augmentations

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
