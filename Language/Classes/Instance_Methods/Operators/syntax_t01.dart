/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * operatorSignature: 
 *   returnType? operator operator formalParameterList 
 * ;
 * operator: 
 *   ‘˜’ |
 *   binaryOperator | 
 *   ‘[’ ‘]’ |
 *   ‘[’ ‘]’ ‘=’
 * ;
 * binaryOperator: 
 *   multiplicativeOperator | 
 *   additiveOperator | 
 *   shiftOperator |
 *   relationalOperator | 
 *   ‘==’ |
 *   bitwiseOperator 
 * ;
 * @description Checks that any return type (including function type, type 
 * parameter, void or no return type at all) can be specified for any operator.
 * @author iefremov
 */

typedef int foo(double);

class C<T> {
  int operator +(var v) {}
  List operator [](var v) {}
  operator -() {}
  operator -(var v) {}
  operator []=(var v, var v2) {}
  dynamic operator ~() {}
  foo operator *(var v) {}
  T operator >(var v) {}
}

main() {
  try {
    C c = new C();
    dynamic x = c + c;
    x = c - c;
    x = c[c];
    c[c] = c;
    -c;
    x = ~c;
    x = c == c;
  } catch (ok) {}
}
