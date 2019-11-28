/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call the default List constructor with a length
 * argument and a type argument which is potentially non-nullable.
 *
 * @description Check that it is no error to call the default List constructor
 * without a length argument or a type argument which is not potentially
 * non-nullable. Test function types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
typedef void Foo();

main() {
  new List<Function>(42);
//    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new List<Function>(0);
//    ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new List<Foo>(42);
//    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new List<Foo>(0);
//    ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
