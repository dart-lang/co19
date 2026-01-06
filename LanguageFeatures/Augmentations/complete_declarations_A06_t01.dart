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
/// @description Checks that it is a compile-time error if a late variable is
/// augmented with another non-abstract variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

late int topLevelVariable;
augment int topLevelVariable;
//          ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static late int staticVariable;
  late int get instanceVariable;
}

augment class C {
  augment static int staticVariable = 0;
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int instanceVariable = 0;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static late int staticVariable;
  late int get instanceVariable;
}

augment mixin M {
  augment static int staticVariable = 0;
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int instanceVariable = 0;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static late int staticVariable;
}

augment enum E {
  ;
  augment static int staticVariable = 0;
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static late int staticVariable;
}

augment extension Ext {
  augment static int staticVariable = 0;
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static late int staticVariable;
}

augment extension type ET {
  augment static int staticVariable = 0;
//                   ^^^^^^^^^^^^^^
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
