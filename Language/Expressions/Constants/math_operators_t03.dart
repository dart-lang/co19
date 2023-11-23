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
/// @description Checks that an expression of the form e1 - e2 cannot be used to
/// initialize a constant variable if e2 is string.
/// @author iefremov


const m = 1 - "1";
//            ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  try {
    print(m);
  } catch (x) {}
}
