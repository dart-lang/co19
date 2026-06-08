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
/// • A literal number is a potentially constant and constant expression if it
///   evaluates to an instance of type `int` or `double`.
///
/// @description Checks that various literal numbers can be elements of a
/// constant list literal and are, therefore, constant expressions. Minus sign
/// is not a part of a number literal so those are not included in this test.
/// @note Should be OK both with dart and dart2js runs.
/// @author iarkh@unipro.ru

final constList = const [
  0,
  1,
  2147483647,
  .2147483648E10,
  .9223372036854775807,
  9223372036854775808E-100,
  9223372036854775808e0,
  9223372036854775809e+9223372036854775809,
  92233720368547758080.9223372036854775808e-00124155125325235,
  92233720368547758080.9223372036854775808e+92233720368547758080,
  92233720368547758080.9223372036854775808E-92233720368547758080,
  0xFF,
  0xFfFfFfFf
];

main() {
  print(constList);
}
