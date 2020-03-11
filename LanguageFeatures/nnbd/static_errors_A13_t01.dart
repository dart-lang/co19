/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call the default List constructor.
 *
 * @description Check that it is an error to call the default List constructor.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

main() {
  new List(42);
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new List();
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new List<int>(42);
//    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new List<int>();
//    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new List<int?>(42);
//    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new List<int?>();
//    ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
