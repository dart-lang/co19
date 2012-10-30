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
 * @description Checks that expressions composed from prefix/unary operators and super that fit into this production
 * don't cause compile-time errors.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 * @note see also A01/t27
 * @note co19 issue #301
 */

class S {
  var x=1;
  operator-() { return this; }
  operator~() { return this; }
}

class A extends S {
  test() {
    -super;
//    !super;
    ~super;
    - -super; // should be interpreted as -(-super);
//    !!super;
    ~~super;
    try {
      !-super;
    } catch (ok) {}
//    -!super;
    ~-super;
    -~super;
    try {
      !~super;
    } catch (ok) {}
//    ~!super;
  }
}

main() {
  A a = new A();
  a.test();
}
