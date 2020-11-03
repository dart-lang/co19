/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A spreadElement starting with [...] is a constant element if its expression
 * is constant and it evaluates to a constant List, Set or Map instance
 * originally created by a list, set or map literal. It is a potentially
 * constant element if the expression is a potentially constant expression.
 * @description: Checks that constant map spread element cannot be non-constant,
 * cannot be [null] and cannot be [List], [Set] or [int].
 * @author iarkh@unipro.ru
 */

const l1 = [];
List l2 = [];

const s1 = {11};
Set s2 = {};

Map m = {2: 2};

const int i1 = 25;
int i2 = 25;

const n = null;

main() {
  const Map res1  = const {...l1};
  //                ^^^^^^^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
  // [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  const Map res2  = const {...l2};
// [error line 35, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res3  = const {...s1};
// [error line 39, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res4  = const {...s2};
// [error line 43, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res5  = const {...m};
// [error line 47, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res6  = const {...i1};
// [error line 51, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res7  = const {...i2};
// [error line 55, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res8  = const {...n};
  //        ^
  // [cfe] Constant evaluation error:
  //                          ^
  // [analyzer] COMPILE_TIME_ERROR.CONST_SPREAD_EXPECTED_MAP
}
