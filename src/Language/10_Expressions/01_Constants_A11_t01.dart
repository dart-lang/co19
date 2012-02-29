/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of one of the forms !e, e1 && e2 or e1 || e2, where e, e1 and
 * e2 are constant expressions that evaluate to a boolean value is a constant expression.
 * @description Checks that various expressions of the specified forms can be assigned 
 * to a static final variable and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 */

final x = !true;
final x2 = !false;
final x3 = true && false;
final x4 = x3 || x2;
final x5 = (!x || x2) && !(x2 == x3);

main() {
  var z = x || x2 || x3 || x4 || x5;
  Expect.isTrue(z);
}
