// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A factory constructor is incomplete after all augmentations are applied.
///
/// @description Checks that it is a compile-time error if a factory constructor
/// is incomplete after all augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C(int x);
  factory C.f1();
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory C.f2([int x]);
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory C.f3({int x});
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment factory C.f1();
  augment factory C.f2([int x = 0]);
  augment factory C.f3({int x = 0});
}

extension type ET(int x) {
  factory ET.f1();
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory ET.f2([int x]);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory ET.f3({int x});
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment factory ET.f1();
  augment factory ET.f2([int x = 0]);
  augment factory ET.f3({int x = 0});
}

main() {
  print(C);
  print(ET);
}
