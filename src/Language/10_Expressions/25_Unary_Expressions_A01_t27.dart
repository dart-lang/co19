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
 */

class S {
  var x = 1;
  operator negate() {}
}

class A extends S {
  test() {
    //combination of prefix and postfix operator
    -x--;
    try {!x++;} catch(var e){}
    ~x--;

    //combination of prefix and increment operator
    --x;
    ++x;
    - --x;
    try {!--x;} catch(var e){}
    ~--x;
    -++x;
    ~++x;

    //prefix operators with identifier
    -x;
    ~x;
    try {!x;} catch(var e){}
    try {!~x;} catch(var e){}
    try {~!x;} catch(var e){}

    //prefix operators with literals
    -1;
    ~2;
    try {!3;} catch(var e){}

    try {-null;} catch(var e) {}
    try {~null;} catch(var e) {}
    try {!null;} catch(var e) {}

    try {-this;} catch(var e) {}
    try {~this;} catch(var e) {}
    try {!this;} catch(var e) {}

    try {-true;} catch(var e) {}
    try {!false;} catch(var e) {}
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
  }
}

main() {
  A a = new A();
  a.test();
}