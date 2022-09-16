// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile time error to call any of enums constructors
///
/// @description Check that it’s a compile time error to call any of enums
/// constructors
/// @author sgrekhov@unipro.ru

enum E {
  e1(1),
  e2.named(3),
  e3(3);

  const E(int i);
  const E.named(int i) : this(i);

  Function get getConstructor => E.named;
//                               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  E.e1.getConstructor(42);
}
