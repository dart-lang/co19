// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile time error to call any of enums constructors
///
/// @description Check that it’s a compile time error to call any of enums
/// constructors
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E {
  e1(1),
  e2.named(2, 3);

  const E(int i);
  const E.named(int i, int j) : this(i);
}

main() {
  E e1 = const E(42);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  E e2 = const E.named(1, 2);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}
