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
/// - The signature of the augmenting getter or setter does not match the
///   signature of the augmented getter or setter.
///
/// @description Checks that it is a compile-time error if the return type of an
/// augmentation doesn't exactly match the original setter. Test implicit
/// dynamic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void set topLevelSetter1(v);
augment void set topLevelSetter1(int v) {}
//                               ^^^
// [analyzer] unspecified
// [cfe] unspecified

void set topLevelSetter2(v);
augment void set topLevelSetter2(Object? v) {}
//                               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void set staticSetter1(v);
  augment static void set staticSetter1(int v) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void set staticSetter2(v);
  augment static void set staticSetter2(Object? v) {}
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter1(v);
  augment void set instanceSetter1(int v) {}
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter2(v);
  augment void set instanceSetter2(Object? v) {}
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void set staticSetter1(v);
  augment static void set staticSetter1(int v) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void set staticSetter2(v);
  augment static void set staticSetter2(Object? v) {}
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter1(v);
  augment void set instanceSetter1(int v) {}
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter2(v);
  augment void set instanceSetter2(Object? v) {}
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static void set staticSetter1(v);
  augment static void set staticSetter1(int v) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void set staticSetter2(v);
  augment static void set staticSetter2(Object? v) {}
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter1(v);
  augment void set instanceSetter1(int v) {}
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter2(v);
  augment void set instanceSetter2(Object? v) {}
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void set staticSetter1(v);
  augment static void set staticSetter1(int v) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void set staticSetter2(v);
  augment static void set staticSetter2(Object? v) {}
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter1(v);
  augment void set instanceSetter1(int v) {}
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter2(v);
  augment void set instanceSetter2(Object? v) {}
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void set staticSetter1(v);
  augment static void set staticSetter1(int v) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void set staticSetter2(v);
  augment static void set staticSetter2(Object? v) {}
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter1(v);
  augment void set instanceSetter1(int v) {}
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set instanceSetter2(v);
  augment void set instanceSetter2(Object? v) {}
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
