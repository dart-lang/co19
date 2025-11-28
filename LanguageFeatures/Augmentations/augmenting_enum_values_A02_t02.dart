// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Enum values themselves can't be augmented since they are
/// essentially constant variables and constant variables can't be augmented.
///
/// @description Checks that it is a compile-time error to augment an enum value
/// by the constructor invocation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E {
  e0(1),
  e1.foo();

  const E(int i);
  const E.foo();
}

augment enum E {
  e2.foo();
}

augment enum E {
  augment e2.foo();
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E);
}
