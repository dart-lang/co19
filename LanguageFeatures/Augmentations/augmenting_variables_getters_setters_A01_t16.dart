// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For purposes of augmentation, a variable declaration is treated
/// as implicitly defining a getter whose return type is the type of the
/// variable. If the variable is not `final`, or is `late` without an
/// initializer, then the variable declaration also implicitly defines a setter
/// with a parameter named `_` whose type is the type of the variable.
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
/// @description Checks that it is a compile-time error if an incomplete getter
/// of an enum, extension or extension type is augmented by a `late final`
/// variable with an initializing expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E {
  e0;
  int get instanceGetter;
}

augment enum E {
  ;
  augment late final int instanceGetter = 1;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  int get instanceGetter;
}

augment extension Ext {
  augment late final int instanceGetter = 2;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  int get instanceGetter;
}

augment extension type ET {
  augment late final int instanceGetter = 3;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E);
  print(A);
  print(ET);
}
