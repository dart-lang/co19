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
/// augments a setter declaration and there is a getter with the same name (or
/// vice versa) but in the superinterface. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract class A1 {
  int get instanceVariable;
}

abstract class A2 {
  void set instanceVariable(int _);
}

extension type ET1(A1 v) implements A1 {
  void set instanceVariable(int v) {}
}

extension type ET2(A2 v) implements A2 {
  int get instanceVariable => 2;
}

augment extension type ET1 {
  augment abstract var instanceVariable;
//                     ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET2 {
  augment abstract var instanceVariable;
//                     ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
}
