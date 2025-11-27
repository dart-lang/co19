// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmentation chain has exactly one specification of a default value
///   for an optional parameter, and the constructor is a redirecting factory.
///
/// @description Checks that it is a compile-time error if the augmentation
/// chain has exactly one specification of a default value for an optional
/// parameter, but the constructor is a redirecting factory.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C([int x = 0]);
  C._({int x = 0});
  factory C.foo([int x]) = C;
  factory C.bar({int x}) = C._;
}

augment class C {
  augment factory C.foo([int x = 0]);
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.bar({int x = 0});
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.c1([this.x = 0]);
  ET.c2({this.x = 0});
  factory ET.foo([int x]) = ET.c1;
  factory ET.bar({int x}) = ET.c2;
}

augment extension type ET {
  augment ET.foo([int x = 0]);
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar({int x = 0});
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
