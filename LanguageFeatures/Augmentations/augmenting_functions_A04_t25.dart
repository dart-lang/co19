// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type (or the augmenting declaration omits the type).
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`. or none of them have it.
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

void topLevelFunction1(int x) {}
void topLevelFunction2([int _x = 2]) {}

augment void topLevelFunction1(int _);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
augment void topLevelFunction2([int _]);
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void staticMethod1(int _x) {}
  static void staticMethod2([int x = 2]) {}
  void instanceMethod1(int x) {}
  void instanceMethod2([int _x = 2]) {}
}

augment class C {
  augment static void staticMethod1(int _);
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int _]);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1(int _);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int _]);
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void staticMethod1(int _x) {}
  static void staticMethod2([int x = 2]) {}
  void instanceMethod1(int x) {}
  void instanceMethod2([int _x = 2]) {}
}

augment mixin M {
  augment static void staticMethod1(int _);
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int _]);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1(int _);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int _]);
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  static void staticMethod1(int _x) {}
  static void staticMethod2([int x = 2]) {}
  void instanceMethod1(int x) {}
  void instanceMethod2([int _x = 2]) {}
}

augment enum E {
  ;
  augment static void staticMethod1(int _);
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int _]);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1(int _);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int _]);
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void staticMethod1(int _x) {}
  static void staticMethod2([int x = 2]) {}
  void instanceMethod1(int x) {}
  void instanceMethod2([int _x = 2]) {}
}

augment extension Ext {
  augment static void staticMethod1(int _);
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int _]);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1(int _);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int _]);
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void staticMethod1(int _x) {}
  static void staticMethod2([int x = 2]) {}
  void instanceMethod1(int x) {}
  void instanceMethod2([int _x = 2]) {}
}

augment extension type ET {
  augment static void staticMethod1(int _);
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int _]);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod1(int _);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int _]);
//                                  ^
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
