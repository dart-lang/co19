// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error if the name of a
/// positional parameter of an augmenting function is not the same as the name
/// of the corresponding positional parameter in an introductory declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void topLevelFunction1(int _) {}
void topLevelFunction2([int _ = 2]) {}

augment void topLevelFunction1(int x);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

augment void topLevelFunction2([int __]);
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void staticMethod1(int _) {}
  static void staticMethod2([int _ = 2]) {}
  void instanceMethod1(int _) {}
  void instanceMethod2([int _]) {}
}

augment class C {
  augment static void staticMethod1(int _x);
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int x]);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1(int x);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int __ = 2]);
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void staticMethod1(int _) {}
  static void staticMethod2([int _ = 2]) {}
  void instanceMethod1(int _) {}
  void instanceMethod2([int _]) {}
}

augment mixin M {
  augment static void staticMethod1(int _x);
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int x]);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1(int x);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int __ = 2]);
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  static void staticMethod1(int _) {}
  static void staticMethod2([int _ = 2]) {}
  void instanceMethod1(int _) {}
  void instanceMethod2([int _]) {}
}

augment enum E {
  ;
  augment static void staticMethod1(int _x);
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int x]);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1(int x);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int __ = 2]);
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void staticMethod1(int _) {}
  static void staticMethod2([int _ = 2]) {}
  void instanceMethod1(int _) {}
  void instanceMethod2([int _]) {}
}

augment extension Ext {
  augment static void staticMethod1(int _x);
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int x]);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1(int x);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int __ = 2]);
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void staticMethod1(int _) {}
  static void staticMethod2([int _ = 2]) {}
  void instanceMethod1(int _) {}
  void instanceMethod2([int _]) {}
}

augment extension type ET {
  augment static void staticMethod1(int _x);
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int x]);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1(int x);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int __ = 2]);
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified
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
