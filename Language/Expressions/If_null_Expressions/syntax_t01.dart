// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///  ifNullExpression:
///   logicalOrExpression (‘??’ logicalOrExpression)*
///
/// @description Verify several kinds of if-null expressions, logicalOrExpression
/// is a constant value.
/// @author a.semenov@unipro.ru

import '../../../Utils/expect.dart';

main() {
  Expect.equals(1, 1 ?? 2);
//                      ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  Expect.equals(1, 1 ?? 2 ?? 3);
//                      ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//                           ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  Expect.equals(1, 1 ?? 2 ?? 3 ?? 4);
//                      ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//                           ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//                                ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  Expect.equals(2, null ?? 2);
  Expect.equals(1, null ?? 1 ?? 2);
//                              ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  Expect.equals(1, null ?? 1 ?? 2 ?? 3);
//                              ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//                                   ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  Expect.equals(1, null ?? null ?? 1 ?? 2 ?? 3);
//                                      ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//                                           ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  Expect.equals(true, null ?? true ?? 2 ?? 3);
//                                    ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//                                         ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  Expect.equals(false, null ?? false ?? 2 ?? 3);
//                                      ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//                                           ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  Expect.equals('a', 'a' ?? 'bcd');
//                          ^^^^^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  Expect.equals('abc', 'abc' ?? 'cde' ?? 'fgh');
//                              ^^^^^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//                                       ^^^^^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  Expect.equals('abc', null ?? 'abc' ?? 'cde' ?? 'fgh');
//                                      ^^^^^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//                                               ^^^^^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
}
