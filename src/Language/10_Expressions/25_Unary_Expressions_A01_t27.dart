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
 * @description Checks that expressions with a prefix operator which fit into this production
 * don't cause compile-time errors.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

class S {
  var x = 1;
  operator negate() {}
  operator[](var ind) {return x;}
  operator[]=(var ind, var val) {x = val;}
}

class A extends S {
  test() {
    //prefixOperator postfixExpression
    -x--;
    try {!x++;} catch(var e){}
    ~x--;

    //combination of prefix and increment operator
    try {- --x;} catch(var e){}
    try {!--x;} catch(var e){}
    try {~--x;} catch(var e){}
    try {-++x;} catch(var e){}
    try {~++x;} catch(var e){}

    //prefixOperator postfixExpression>primary>identifier
    -x;
    ~x;
    ~~x;
    try {!x;} catch(var e){}
    try {!~x;} catch(var e){}
    try {~!x;} catch(var e){}

    //prefix operators with literals
    try {-1;} catch(var e){}
    try {~2;} catch(var e){}
    try {!3;} catch(var e){}

    try {-null;} catch(var e) {}
    try {~null;} catch(var e) {}
    try {!null;} catch(var e) {}

    try {-this;} catch(var e) {}
    try {~this;} catch(var e) {}
    try {!this;} catch(var e) {}

    try {-true;} catch(var e) {}
    !!false;
    !!!true;
    !!!!false;
    !!!!!!true;
    try {~true;} catch(var e) {}

    try {-[];} catch(var e) {}
    try {~{"1": 1};} catch(var e) {}
    try {!const [1];} catch(var e) {}

    try {-"s";} catch(var e) {}
    try {~"t";} catch(var e) {}
    try {!"r";} catch(var e) {}

    //prefix operators with various expressions
    try {-(){}[0];} catch(var e) {}
    try {! new S();} catch(var e) {}
    try {~(1 + 2);} catch(var e) {}
    
    // super with selector
    try {-super[0];} catch (var ok) {}
    try {~super.x;} catch (var ok) {}
    try {!super[0];} catch (var ok) {}
  }
}

main() {
  A a = new A();
  a.test();
}
