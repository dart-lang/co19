// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion It is a compile-time error if:
 * A spread element in a list or set literal has a static type that is not
 * dynamic and not a subtype of Iterable<Object>.
 * @description Checks that it is a compile error if spread element in the
 * set is not dynamic and is not assignable to [Iterable]
 * @author iarkh@unipro.ru
 */

import "dart:async";

main() {
  Object x1 = Object();
  Map x2 = {0: 0};
  int x3 = 1;
  Null x4 = null;
  void x5;
  Future x6;
  FutureOr x7 = 1;

  Set s1 = {...x1};
// [error line 26, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s2 = {...x2};
  //       ^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
  // [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  Set s3 = {...x3};
// [error line 34, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s4 = {...x4};
// [error line 38, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s5 = {...x5};
// [error line 42, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s6 = {...x6};
// [error line 46, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s7 = {...x7};
// [error line 50, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
