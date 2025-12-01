// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - More than one declaration in the augmentation chain specifies a default
///   value for the same optional parameter. This is an error even in the case
///   where all of them are identical.
///
/// @description Checks that it is a compile-time error when more than one
/// augmenting constructor declaration specify default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C([int x]);
  C.c1({int x});
}

augment class C {
  augment C([int x = 0]);
  augment C.c1({int x = 0});
}

augment class C {
  augment C([int x = 0]);
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  augment C.c1({int x = 0});
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0, e1.c1();
  const E([int x]);
  const E.c1({int x});
}

augment enum E {
  ;
  augment const E([int x = 0]);
  augment const E.c1({int x = 0});
}

augment enum E {
  ;
  augment const E([int x = 0]);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  augment const E.c1({int x = 0});
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  ET.c1(this.id, [int x]);
  ET.c2(this.id, {int x});
}

augment extension type ET {
  augment ET.c1(this.id, [int x = 0]);
  augment ET.c2(this.id, {int x = 0});
}

augment extension type ET {
  augment ET.c1(this.id, [int x = 0]);
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET.c2(this.id, {int x = 0});
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
