/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unary expressions invoke unary operators on objects.
 * unaryExpression:
 *   prefixOperator unaryExpression |
 *   postfixExpression |
 *   unaryOperator super |
 *   '-' super |
 *   incrementOperator assignableExpression
 * ;
 * prefixOperator:
 *   '-' |
 *   negateOperator
 * ;
 * negateOperator:
 *   '!' |
 *   '~'
 * ;
 * @description Checks that expressions with the prefix operator which fit into this production
 * don't cause compile-time errors.
 * @author msyabro
 * @reviewer kaigorodov
 * @note see also A01/t27
 * @note issue #1288
 */

class S {
  var x=1;
  operator negate() {}
}

class A extends S {
  test() {
    //super
    -super;
    !super;
    ~super;
    --super.x;
    !-super;
    ~-super;
    !~super;
  }
}

main() {
  A a = new A();
  a.test();
}
