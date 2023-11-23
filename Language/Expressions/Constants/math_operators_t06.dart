// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • An expression of the form e1 + e2 where e1 and e2 are constant expressions
///   that evaluate to a numeric or string value or to null.
/// • An expression of one of the forms −e, e1 - e2, e1 * e2, e1 / e2, e1 ˜/ e2,
///   e1 > e2, e1 < e2, e1 >= e2, e1 <= e2 or e1 % e2, where e, e1 and e2 are
///   constant expressions that evaluate to a numeric value or to null.
/// @description Checks that expressions of the specified forms can be
/// used within the initializer list of a constant constructor and are,
/// therefore, constant expressions. Tests big integer numbers, so should be
/// excluded for the web runs.
/// @note The part of the initial test which should work OK with all
/// configurations is moved to the math_operator_t09.dart.
/// @author iefremov


class C {
  const C() : d = -999999999999999999;
  final d;
}


main() {
  const C();
}
