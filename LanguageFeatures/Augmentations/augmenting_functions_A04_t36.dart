// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - The two declarations have the same type parameters.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
/// ...
/// When an augmentation must have the "same type parameters" as an
/// introductory declaration, that means:
/// - They must have the same number of type parameters (which may be zero).
/// - For each corresponding pair of type parameters:
///   - They must have the same name (same identifier).
///   - Their bounds must be the same type. This is after any omitted bound in
///     an introductory declaration has been given a default bound of `Object?`
///     and where any omitted bound in an augmentation has been inherited from
///     the introductory declaration.
///
/// @description Checks that it is a compile-time error if an introductory
/// function omits the bound of a type parameter and an augmenting function
/// specifies a bound other than `Object?`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void topLevelFunction<T>() {}

augment void topLevelFunction<T extends List<int>>();
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment void topLevelFunction<T extends Object>();
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment void topLevelFunction<T extends dynamic>();
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void staticMethod<T>() {}
  void instanceMethod<T>() {}
}

augment class C {
  augment static void staticMethod<T extends List<int>>();
//                                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<T extends dynamic>();
//                                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod<T extends Object>();
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<T extends dynamic>();
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void staticMethod<T>() {}
  void instanceMethod<T>() {}
}

augment mixin M {
  augment static void staticMethod<T extends List<int>>();
//                                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<T extends dynamic>();
//                                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod<T extends Object>();
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<T extends dynamic>();
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static void staticMethod<T>() {}
  void instanceMethod<T>() {}
}

augment enum E {
  ;
  augment static void staticMethod<T extends List<int>>();
//                                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<T extends dynamic>();
//                                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod<T extends Object>();
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<T extends dynamic>();
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void staticMethod<T>() {}
  void instanceMethod<T>() {}
}

augment extension Ext {
  augment static void staticMethod<T extends List<int>>();
//                                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<T extends dynamic>();
//                                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod<T extends Object>();
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<T extends dynamic>();
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void staticMethod<T>() {}
  void instanceMethod<T>() {}
}

augment extension type ET {
  augment static void staticMethod<T extends List<int>>();
//                                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<T extends dynamic>();
//                                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod<T extends Object>();
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<T extends dynamic>();
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
