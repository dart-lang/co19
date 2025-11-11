// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if parameter names of
/// the constructor augmentation does not match the original constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x, y;
  C(this.x, this.y);
  C.foo([this.x = 0, this.y = 0]);
}

augment class C {
  augment C(int y, int x);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo([int y, int x]);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(1, 2);
  final int x, y;
  const E(this.x, this.y);
  const E.foo([this.x = 0, this.y = 0]);
}

augment enum E {
  augment const E(int y, int x);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo([int y, int x]);
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.foo(this.x, int y);
  ET.bar([this.x = 0, int y = 0]);
}

augment extension type ET {
  augment ET.foo(int y, int x);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar([int y, int x]);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
