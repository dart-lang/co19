// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For purposes of augmentation, a variable declaration is treated
/// as implicitly defining a getter whose return type is the type of the
/// variable. If the variable is not final, or is late without an initializer,
/// then the variable declaration also implicitly defines a setter with a
/// parameter named `_` whose type is the type of the variable.
///
/// If the variable is `abstract`, then the getter and setter are incomplete,
/// otherwise they are complete. For non-abstract variables, the compiler
/// synthesizes a getter that accesses the backing storage and a setter that
/// updates it, so these members have bodies.
///
/// A getter can be augmented by another getter, and likewise a setter can be
/// augmented by a setter. This is true whether the getter or setter is
/// explicitly declared or implicitly declared using a variable declaration.
///
/// @description Checks that a it is a compile-time error if a variable is
/// augmented by a variable with another type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

num topLevelVariable1 = 0;
augment abstract int topLevelVariable1;
//                   ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract num topLevelVariable2;
augment Object topLevelVariable2 = 0;
//             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

// TODO (sgrekhov) This test does not include static abstract variable
// declarations because the grammar doesn't derive them. See
// https://github.com/dart-lang/language/issues/4592

class C {
  num instanceVariable1 = 0;
  abstract num instanceVariable2;
}

augment class C {
  augment abstract int instanceVariable1;
//                     ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object instanceVariable2 = 0;
//               ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  num instanceVariable1 = 0;
  abstract num instanceVariable2;
}

augment mixin M {
  augment abstract int instanceVariable1;
//                     ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object instanceVariable2 = 0;
//               ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  final num instanceVariable1 = 0;
  abstract final num instanceVariable2;
}

augment class C {
  augment abstract final int instanceVariable1;
//                           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final Object instanceVariable2 = 0;
//                     ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int instanceVariable) {}

augment extension type ET1 {
  augment abstract final num instanceVariable;
//                           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(num instanceVariable) {}

augment extension type ET2 {
  augment abstract final int instanceVariable;
//                           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelVariable1);
  print(topLevelVariable2);
  print(C);
  print(M);
  print(E);
  print(ET1);
  print(ET2);
}
