// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow augment before class, extension type, and mixin
/// declarations. (Enums and extensions are discussed in subsequent sections.)
///
/// @description Checks that it is a syntax error to augment a typedef.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C0 {}

typedef C1 = C0;
augment typedef C1 = C0;
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef C2 = C0;
augment typedef C2;
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
}
