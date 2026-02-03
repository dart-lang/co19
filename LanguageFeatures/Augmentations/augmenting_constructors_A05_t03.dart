// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// The augmentation chain has exactly one specification of a default value for
/// an optional parameter, and the constructor is a redirecting factory.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting factory constructor if an introductory constructor has any
/// default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x;
  C([this.x = 0]);
  C.foo({this.x = 0});
  factory C.bar([int x = 0]);
  factory C.baz({int x = 0});
}

augment class C {
  augment factory C.bar([int x]) = C;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.baz({int x}) = C.foo;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.foo([this.x = 0]);
  ET.bar({this.x = 0});
  factory ET.baz([int x = 0]);
  factory ET.qux({int x = 0});
}

augment extension type ET {
  augment factory ET.baz([int x]) = ET;
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory ET.qux({int x}) = ET.foo;
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
