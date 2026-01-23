// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation declaration `D` is a declaration marked with the
/// built-in identifier `augment`. We add `augment` as a built-in identifier as
/// a language versioned change, to avoid breaking pre-feature code.
///
/// `D` augments a declaration `I` with the same name and in the same
/// augmentation context as `D`. There may be multiple augmentations in the
/// augmentation context of `D`. More precisely, `I` is the declaration before
/// `D` and after every other declaration before `D`.
///
/// @description Checks that it is a compile-time error if an introductory
/// declaration is not before the augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E {e0;}
//           ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension Ext {}
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

class C {}

mixin M {}

enum E {e0;}

class A {}
extension Ext on A {}

extension type ET(int _) {}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
