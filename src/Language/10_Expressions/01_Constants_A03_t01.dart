/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A literal string where any interpolated expression is a
 * compile-time constant that evaluates to a numeric, string or boolean value or to null,
 * is a constant expression.
 * @description Checks that various literal strings can be elements of a constant list literal
 * and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 */

final constList = const [
  "",
  "test",
  'test',
  @"test",
  @'test',
  """test
    test""",
  '''test
    test''',
  @"""test
    test""",
  @'''test
    test'''
];

final constListInterpolation = const [
  '${'test'}'
  '${'${'test'}'}',
  '${'test'} ${10500 - 500}  ${((1 == 2) != ("" == "b")) === (false !== true)}',
  '${'${'test'} ${10500 - 500}  ${((1 == 2) != ("" == "b")) === (false !== true)}'}',
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
  @"1" @'2',
  '''a
  a''' """bb"""
];

main() {
  Expect.isTrue(constList is List);
  Expect.isTrue(constListInterpolation is List);
  Expect.isTrue(constListConcatenation is List);
}
