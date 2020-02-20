/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call the default List constructor with a length
 * argument and a type argument which is potentially non-nullable.
 *
 * @description Check that it is an error to call the default List constructor
 * with a length argument and a type argument which is potentially non-nullable.
 * Test some class A
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {}

main() {
  new List<A>(42);
//    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new List<A>(0);
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
