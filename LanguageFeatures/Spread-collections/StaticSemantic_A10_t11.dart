/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A spread element in a list or set literal has a static type that is not
 * dynamic and not a subtype of Iterable<Object>.
 * @description Checks that compile error is thrown if spread element in the
 * constant set is not dynamic and is not assignable to [Iterable]
 * @author iarkh@unipro.ru
 */

main() {
  const Map x1 = {1: 1};
  const x2 = 100;
  const x3 = "check";
  const x4 = null;

  const Set s1 = {...x1};
// [error line 21, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Set s2 = {...x2};
// [error line 25, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Set s3 = {...x3};
// [error line 29, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Set s4 = {...x4};
  //             ^
  // [cfe] Constant evaluation error:
  //                 ^^
  // [analyzer] COMPILE_TIME_ERROR.CONST_SPREAD_EXPECTED_LIST_OR_SET
}
