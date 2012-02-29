/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  An expression of one of the forms e1 == e2, e1 != e2, e1 === e2 or
 * e1 !== e2, where e1 and e2 are constant expressions that evaluate to a
 * numeric, string or boolean value is a constant expression.
 * @description Checks that various expressions of the specified forms can be assigned
 * to a static final variable and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 * @note http://code.google.com/p/dart/issues/detail?id=1671
 */

final x = 1 == 2;
final x1 = "a" === "b";
final x2 = true !== false;
final x3 = (true != 1);
final x4 = "a" === false;

final xz = ((1 == 2) != ("" == "b")) === (false !== true);

main() {
  Expect.isFalse(x);
  Expect.isFalse(x1);
  Expect.isTrue(x2);
  Expect.isTrue(x3);
  Expect.isFalse(x4);
  Expect.isTrue(xz);
}
