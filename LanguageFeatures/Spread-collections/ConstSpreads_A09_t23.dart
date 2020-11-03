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
 * @description: Checks some disambiguilty cases for sets and maps.
 * @author iarkh@unipro.ru
 */

const l1 = [];
List l2 = [];

const s1 = {11};
Set s2 = {};

const m1 = {1: 1};
Map m2 = {2: 2};

const int i1 = 25;
int i2 = 25;

const n = null;

main() {
  const res1 = {...l2};
// [error line 31, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res2 = {...s2};
// [error line 35, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res3 = {...l1, 123: 2};
  //           ^^^^^^^^^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_BOTH
  // [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  const res4 = {14: 3, ...s1};
  //           ^^^^^^^^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_BOTH
  // [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  const res5 = {...m1, 13};
  //           ^^^^^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_BOTH
  //               ^
  // [cfe] Unexpected type 'Map<int, int>' of a spread.  Expected 'dynamic' or an Iterable.
  const res6 = {...m2};
// [error line 52, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res7 = {...i1};
// [error line 56, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res8 = {...i2};
// [error line 60, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const res9 = {...n};
  //           ^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_EITHER
  // [cfe] Not enough type information to disambiguate between literal set and literal map.
  const res10 = {...null};
// [error line 68, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
