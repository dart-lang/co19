// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - More than one declaration in the augmentation chain specifies a default
///   value for the same optional parameter. This is an error even in the case
///   where all of them are identical.
///
/// @description Checks that it is a compile-time error when more than one
/// augmenting constructor declaration specify default values. Test
/// non-redirecting factory constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int x;
  C(this.x);
  factory f1({int x = 0});
  factory f2({int x = 0}) => C(x);
}

augment class C {
  augment factory f1({int x = 0}) => C(x);
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory f2({int x = 0});
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(0);

  final int x;
  E(this.x);
  factory f1({int x = 0});
  factory f2({int x = 0}) => E.e0;
}

augment enum E {
  ;
  augment factory f1({int x = 0}) => E.e0;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory f2({int x = 0});
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  factory f1({int x = 0});
  factory f2({int x = 0}) => ET(x);
}

augment extension type ET {
  augment factory f1({int x = 0}) => ET(x);
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory f2({int x = 0});
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
