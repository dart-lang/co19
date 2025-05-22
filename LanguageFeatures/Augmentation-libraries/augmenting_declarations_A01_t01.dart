// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if there is no matching declaration I.
/// In other words, it's an error to have a declaration marked augment with no
/// declaration to apply it to.
///
/// @description Checks that it is a compile-time error if a library contains an
/// augmenting declaration, but there is no introductory declaration with the
/// corresponding name in the same scope.
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

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
