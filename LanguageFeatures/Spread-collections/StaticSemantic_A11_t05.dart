/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A spread element in a map literal has a static type that is not [dynamic] and
 * not a subtype of [Map<Object, Object>].
 * @description Checks that compile error is thrown if spread element in the
 * constant map is not assignable to [Map]
 * @author iarkh@unipro.ru
 */

main() {
  const x1 = [];
  const x2 = {1};
  const x3 = 100;
  const x4 = "check";
  const x5 = null;

  const Map m1 = {...x1};
  //             ^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
  // [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  const Map m2 = {...x2};
// [error line 26, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map m3 = {...x3};
// [error line 30, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map m4 = {...x4};
// [error line 34, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map m5 = {...x5};
  //        ^
  // [cfe] Constant evaluation error:
  //                 ^^
  // [analyzer] COMPILE_TIME_ERROR.CONST_SPREAD_EXPECTED_MAP
}
