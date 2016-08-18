/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
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
 * @description Checks that it is not a compile-time error if a class attempts 
 * to define an operator without a name because an instance method named 
 * 'operator' is allowed by the spec.
 * @author iefremov
 */

class C {
  int operator(var v) {}
}

main() {
  try {
    C c = new C();
  } catch (x) {}
}
