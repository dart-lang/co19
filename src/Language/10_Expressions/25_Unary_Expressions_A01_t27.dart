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
    try {!x++;} catch(e){}
    ~x--;

    //combination of prefix and increment operator
    try {- --x;} catch(e){}
    try {!--x;} catch(e){}
    try {~--x;} catch(e){}
    try {-++x;} catch(e){}
    try {~++x;} catch(e){}

    //prefixOperator postfixExpression>primary>identifier
    -x;
    ~x;
    ~~x;
    try {!x;} catch(e){}
    try {!~x;} catch(e){}
    try {~!x;} catch(e){}

    //prefix operators with literals
    try {-1;} catch(e){}
    try {~2;} catch(e){}
    try {!3;} catch(e){}

    try {-null;} catch(e) {}
    try {~null;} catch(e) {}
    try {!null;} catch(e) {}

    try {-this;} catch(e) {}
    try {~this;} catch(e) {}
    try {!this;} catch(e) {}

    try {-true;} catch(e) {}
    !!false;
    !!!true;
    !!!!false;
    !!!!!!true;
    try {~true;} catch(e) {}

    try {-[];} catch(e) {}
    try {~{"1": 1};} catch(e) {}
    try {!const [1];} catch(e) {}

    try {-"s";} catch(e) {}
    try {~"t";} catch(e) {}
    try {!"r";} catch(e) {}

    //prefix operators with various expressions
    try {-(){}[0];} catch(e) {}
    try {! new S();} catch(e) {}
    try {~(1 + 2);} catch(e) {}
    
    // super with selector
    try {-super[0];} catch(ok) {}
    try {~super.x;} catch(ok) {}
    try {!super[0];} catch(ok) {}
  }
}

main() {
  A a = new A();
  a.test();
}
