// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This is true even if the object being spread is a user-defined
/// class that implements [Iterable] but isn't even a subtype of List.
/// @description Checks that compile error appears if set spread element does not
/// extends [Iterable].
/// @author iarkh@unipro.ru


main() {
  int i = 1;
  String str = "abs";

  Set s1 = {...{1: 11}};
//         ^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
//             ^
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  Set s2 = {1, 2, ...i};
//                   ^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'int' of a spread.  Expected 'dynamic' or an Iterable.
  Set s3 = {14, ...str, 28};
//                 ^^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'String' of a spread.  Expected 'dynamic' or an Iterable.

  int? i1 = i;
  String? str1 = str;
  Set s4 = {...?({1: 11} as Map?)};
//         ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  Set s5 = {1, 2, ...?i1};
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
  Set s6 = {14, ...?str1, 28};
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
