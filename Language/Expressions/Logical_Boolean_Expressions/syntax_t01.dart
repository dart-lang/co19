/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The logical boolean expressions combine boolean objects using
 * the boolean conjunction and disjunction operators.
 * logicalOrExpression:
 *   logicalAndExpression ('||' logicalAndExpression)*
 * ;
 * logicalAndExpression:
 *   equalityExpression ('&&' equalityExpression)*
 * ;
 * A logical boolean expression is either an equality expression, or an
 * invocation of a logical boolean operator on an expression e1 with argument
 * e2.
 * @description Checks that various expression which fit into this grammar
 * don't cause compile-time errors.
 * @author msyabro
 * @author kaigorodov
 */

import "../../../Utils/expect.dart";

class A {
  int method() {return 3;}
  var id = 6;

  test() {
    //literals
    false || true;
    Expect.throws(() => false || null);

    //equality
    id == id || true == false;
    1 != 1 && true;

    //logical and relational expressions
    1 < 2 || id > 1 ? 1 : id;
  }
}

main() {
  A a = new A();
  a.test();
}
