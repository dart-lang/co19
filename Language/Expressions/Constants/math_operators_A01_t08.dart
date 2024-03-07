// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// The potentially constant expressions and constant expressions are the
/// following:
/// . . .
/// • An expression of the form e1 + e2 is a potentially constant expression if
///   e1 and e2 are both potentially constant expressions. It is further a
///   constant expression if both e1 and e2 are constant expressions and either
///   both evaluate to an instance of int or double, or both evaluate to an
///   instance of String, such that ‘+’ denotes an instance operator invocation.
/// • An expression of the form -e1 is a potentially constant expression if e1
///   is a potentially constant expression. It is further a constant expression
///   if e1 is a constant expression that evaluates to an instance of type int
///   or double, such that ‘-’ denotes an instance operator invocation.
/// • An expression of the form e1 - e2, e1 * e2, e1 / e2, e1 ~/ e2, e1 % e2,
///   e1 < e2, e1 <= e2, e1 > e2, or e1 >= e2 is potentially constant if e1 and
///   e2 are both potentially constant expressions. It is further constant if
///   both e1 and e2 are constant expressions that evaluate to instances of int
///   or double, such that the given operator symbol denotes an invocation of an
///   instance operator
///
/// @description Checks that a constant expression `e1 + e2` ie evaluated
/// correctly in case of extension types
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

extension type const ExtNum(num _) implements num {}
extension type const ExtInt(int it) implements int {}
extension type const ExtDouble(double it) implements double {}
extension type const ExtString(String _) implements String {}

void main() {
  const c1 = ExtNum(1) + 1;
  Expect.identical(2, c1);

  const c2 = ExtNum(3.14) + 1;
  Expect.approxEquals(4.14, c2);

  const c3 = ExtNum(3.14) + 1.1;
  Expect.approxEquals(4.24, c3);

  const c4 = ExtNum(2) + 3.14;
  Expect.approxEquals(5.14, c4);

  const c5 = ExtInt(3) + 1;
  Expect.identical(4, c5);

  const c6 = ExtDouble(3.14) + 1;
  Expect.approxEquals(4.14, c6);

  const c7 = ExtDouble(3.14) + 1.1;
  Expect.approxEquals(4.24, c7);

  const c8 = ExtString("a") + "b";
  Expect.identical("ab", c8);
}
