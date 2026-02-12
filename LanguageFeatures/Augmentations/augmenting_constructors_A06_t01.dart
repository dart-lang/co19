// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - No declaration in the augmentation chain specifies a default value for an
///   optional parameter whose declared type is potentially non-nullable, and
///   the constructor is not a redirecting factory.
///
/// @description Checks that it is a compile-time error if no declaration in the
/// augmentation chain specifies a default value for an optional parameter whose
/// declared type is potentially non-nullable, and the constructor is not a
/// redirecting factory.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C(int x);
  C.c1([int x]);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  C.c2({int x});
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  C.c3([int x]) : this(x);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  C.c4({int x}) : this(x);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  factory C.c5([int x]) => C(x);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  factory C.c6({int x}) => C(x);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment C.c1([int x]) {}
  augment C.c2({int x}) {}
  augment C.c3([int x]);
  augment C.c4({int x});
  augment factory C.c5([int x]);
  augment factory C.c6({int x});
}

enum E {
  e0(0);

  const E(int x);
  const E.c1([int x]);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  const E.c2({int x});
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  const E.c3([int x]) : this(x);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  const E.c4({int x}) : this(x);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  augment const E.c1([int x]);
  augment const E.c2({int x});
  augment const E.c3([int x]);
  augment const E.c4({int x});
}

extension type ET(int x) {
  ET.c1([this.x]);
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  ET.c2({this.x});
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  ET.c3([int x]) : this(x);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  ET.c4({int x}) : this(x);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  factory ET.c5([int x]) => ET(x);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  factory ET.c6({int x}) => ET(x);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.c1([this.x]) {}
  augment ET.c2({this.x}) {}
  augment ET.c3([int x]);
  augment ET.c4({int x});
  augment factory ET.c5([int x]);
  augment factory ET.c6({int x});
}

main() {
  print(C);
  print(E);
  print(ET);
}
