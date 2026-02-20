// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow augment before class, extension type, and mixin
/// declarations. (Enums and extensions are discussed in subsequent sections.)
///
/// @description Checks that it is still an error if an augmentation of an enum
/// or an extension has no body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

enum E {
  e0;
}

augment enum E;
//            ^
// [analyzer] unspecified
// [cfe] unspecified

class A {}

extension Ext on A {}

augment extension Ext;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(E);
  print(Ext);
}
