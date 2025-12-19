// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that if a variable is not `abstract` then it is complete,
/// and it is a compile-time error to augment it with another complete variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

int? topLevelVariable;
augment int? topLevelVariable;
//           ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static int? staticVariable;
  int? instanceVariable;
}

augment class C {
  augment static int? staticVariable;
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int? instanceVariable;
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static int? staticVariable;
  int? instanceVariable;
}

augment mixin M {
  augment static int? staticVariable;
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int? instanceVariable;
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static int? staticVariable;
  final int? instanceVariable;
}

augment enum E {
  ;
  augment static int? staticVariable;
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final int? instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static int? staticVariable;
}

augment extension Ext {
  augment static int? staticVariable;
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int? instanceVariable) {
  static int? staticVariable;
}

augment extension type ET {
  augment static int? staticVariable;
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int? instanceVariable;
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
