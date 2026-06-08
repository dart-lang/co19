// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All usages of ’constant’ in Dart are associated with compile time.
/// A potentially constant expression is an expression that will generally yield
/// a constant value when the values of certain parameters are given. The
/// constant expressions is a subset of the potentially constant expressions
/// that can be evaluated at compile time.
///
/// The potentially constant expressions and constant expressions are the
/// following:
/// ...
/// • A literal string with string interpolations with expressions `e1, ..., en`
///   is a potentially constant expression if `e1, ..., en` are potentially
///   constant expressions. The literal is further a constant expression if
///   `e1, . . . , en` are constant expressions evaluating to instances of `int`,
///   `double`, `String`, `bool`, or `Null`.
///
/// @description Checks that various literal strings can be elements of a
/// constant list literal and are, therefore, constant expressions.
/// @author iefremov

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
  "${1 + 1}",
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
  print(constList);
  print(constListInterpolation);
  print(constListConcatenation);
}
