// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// - The signature of the augmenting getter or setter does not match the
///   signature of the corresponding introductory getter or setter.
///
/// @description Checks that it is a compile-time error if the return type of an
/// augmentation doesn't exactly match the original implicit setter. Test
/// implicit dynamic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

var topLevelSetter1;
augment void set topLevelSetter1(int _);
//                               ^^^
// [analyzer] unspecified
// [cfe] unspecified

var topLevelSetter2;
augment void set topLevelSetter2(Object? _);
//                               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static var staticSetter1;
  augment static void set staticSetter1(int _);
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticSetter2;
  augment static void set staticSetter2(Object? _);
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceSetter1;
  augment void set instanceSetter1(int _);
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceSetter2;
  augment void set instanceSetter2(Object? _);
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static var staticSetter1;
  augment static void set staticSetter1(int _);
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticSetter2;
  augment static void set staticSetter2(Object? _);
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceSetter1;
  augment void set instanceSetter1(int _);
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceSetter2;
  augment void set instanceSetter2(Object? _);
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static var staticSetter1;
  augment static void set staticSetter1(int _);
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticSetter2;
  augment static void set staticSetter2(Object? _);
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static var staticSetter1;
  augment static void set staticSetter1(int _);
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticSetter2;
  augment static void set staticSetter2(Object? _);
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static var staticSetter1;
  augment static void set staticSetter1(int _);
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticSetter2;
  augment static void set staticSetter2(Object? _);
//                                      ^^^^^^^
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
