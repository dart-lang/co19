/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant expression is an expression whose value can never
 * change, and that can be evaluated entirely at compile time.
 * A constant expression is one of the following:
 * . . .
 * • A literal string where any interpolated expression is a compile-time
 *   constant that evaluates to a numeric, string or boolean value or to null.
 * @description Checks that various literal strings can be elements of a
 * constant list literal and are, therefore, constant expressions.
 * @author iefremov
 */

import '../../../Utils/expect.dart';

final constList = const [
  "",
  "test",
  'test',
  r"test",
  r'test',
  """test
    test""",
  '''test
    test''',
  r"""test
    test""",
  r'''test
    test'''
];

final constListInterpolation = const [
  '${'test'}'
  '${'${'test'}'}',
  '${'test'} ${10500 - 500}  ${((1 == 2) != ("" == "b")) == (!identical(false, true))}',
  '${'${'test'} ${10500 - 500}  ${((1 == 2) != ("" == "b")) == (!identical(false, true))}'}',
  '${1.0/0.0}',
  '${0.0/0.0}',
  '${(3.14 * 15926) + (1 ~/ 100)}',
  '${~(((1 + 2) ~/ 2) & (100500 >> 2))  | (~1 ^ (1<<2))}'
  "${'a''b'}",
  '${1}',
  "{1 + 1}",
  '${true}',
  '${2 > 1}',
  '${null}'
];

final constListConcatenation = const [
  '' '',
  "a""b",
  r"1" r'2',
  '''a
  a''' """bb"""
];

main() {
  Expect.isTrue(constList is List);
  Expect.isTrue(constListInterpolation is List);
  Expect.isTrue(constListConcatenation is List);
}
