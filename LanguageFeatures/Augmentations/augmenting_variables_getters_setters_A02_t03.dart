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
/// - The signature of the augmenting getter or setter does not match the
///   signature of the augmented getter or setter.
///
/// @description Checks that it is a compile-time error if the return type of an
/// augmentation doesn't exactly match the original implicit getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

num topLevelVariable1 = 42;
augment int topLevelVariable1;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

num topLevelVariable2 = 42;
augment Object topLevelVariable2;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static num staticVariable1 = 42;
  augment static int staticVariable1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static num staticVariable2 = 42;
  augment static Object staticVariable2;
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  num instanceVariable1 = 42;
  augment int instanceVariable1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  num instanceVariable2 = 42;
  augment Object instanceVariable2;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static num staticVariable1 = 42;
  augment static int staticVariable1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static num staticVariable2 = 42;
  augment static Object staticVariable2;
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  num instanceVariable1 = 42;
  augment int instanceVariable1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  num instanceVariable2 = 42;
  augment Object instanceVariable2;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static num staticVariable1 = 42;
  augment static int staticVariable1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static num staticVariable2 = 42;
  augment static Object staticVariable2;
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final num instanceVariable1 = 42;
  augment int instanceVariable1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final num instanceVariable2 = 42;
  augment Object instanceVariable2;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static num staticVariable1 = 42;
  augment static int staticVariable1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static num staticVariable2 = 42;
  augment static Object staticVariable2;
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static num staticVariable1 = 42;
  augment static int staticVariable1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static num staticVariable2 = 42;
  augment static Object staticVariable2;
//               ^^^^^^
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
