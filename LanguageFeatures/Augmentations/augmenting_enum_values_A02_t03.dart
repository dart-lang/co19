// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Enum values themselves can't be augmented since they are
/// essentially constant variables and constant variables can't be augmented.
///
/// @description Checks that it is a compile-time error to augment an enum value
/// without constructor invocation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E {
  e0(0),
  e1.foo(x: 10),
  e2.bar(20);

  final int x;
  const E(this.x);
  const E.foo({this.x = 1});
  const E.bar([this.x = 2]);
}

augment enum E {
  augment e0,
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1,
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment e2;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E);
}
