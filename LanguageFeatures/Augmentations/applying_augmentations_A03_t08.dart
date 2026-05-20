// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `D` augments a declaration `I` with the same name and in the same
/// augmentation context as `D`. There may be multiple augmentations in the
/// augmentation context of `D`. More precisely, `I` is the declaration before
/// `D` and after every other declaration before `D`.
///
/// It's a compile-time error if there is no matching declaration `I`. In other
/// words, it's an error to have a declaration marked `augment` with no
/// declaration to apply it to.
///
/// @description Checks that it is a compile-time error if an abstract variable
/// augments a getter declaration and there is a setter with the same name but
/// in the superinterface.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract mixin class A {
  void set instanceVariable(int _);
}

abstract class C1 implements A {
  int get instanceVariable;
}

abstract class C2 extends A {
  int get instanceVariable;
}

abstract class C3 with A {
  int get instanceVariable;
}

augment abstract class C1 {
  augment abstract var instanceVariable;
//                     ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment abstract class C2 {
  augment abstract var instanceVariable;
//                     ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment abstract class C3 {
  augment abstract var instanceVariable;
//                     ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
}
