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
/// @description Checks that it is not an error if an expression of the form
/// `-e1` is a constant expression that evaluates to an instance of type `int`
/// or `double`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../../Utils/expect.dart';

extension type const ExtNum(num _) implements num {}

extension type const ExtInt(int _) implements int {}

extension type const ExtDouble(double _) implements double {}

main() {
  const c1 = -ExtNum(1);
  Expect.identical(-1, c1);

  const c2 = -ExtNum(3.14);
  Expect.identical(-3.14, c2);

  const c3 = -ExtInt(2);
  Expect.identical(-2, c3);

  const c4 = -ExtDouble(3.14);
  Expect.identical(-3.14, c4);
}
