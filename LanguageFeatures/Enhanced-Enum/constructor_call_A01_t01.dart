// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile time error to call any of enums constructors
///
/// @description Check that it’s a compile time error to call any of enums
/// constructors
/// @author sgrekhov@unipro.ru

enum E {
  e1,
  e2;

  const E();
}

main() {
  E e = const E();
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}
