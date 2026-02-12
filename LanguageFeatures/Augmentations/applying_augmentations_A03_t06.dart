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
/// @description Checks that it is a compile-time error to augment a body-part
/// of a primary constructor which doesn't exists in an introductory declaration
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1();

augment class C1 {
  augment this;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(var int v) {}

augment class C2 {
  augment this;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1() {
  e0;
}

augment enum E1 {
  ;
  augment this;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(var int v) {
  e0(1);
}

augment enum E2 {
  ;
  augment this;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int v) {}

augment extension type ET {
  augment this;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET);
}
