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
 * @description Checks that it is a compile-time error if an operator-specific
 * method name is used without the operator keyword.
 * @compile-error
 * @author iefremov
 */

class C {
  int ~/(var v) {} /// compile-time error
}

main() {
  try {
    C c = new C();
    var x = c ~/ 'a';
  } catch (x) {}
}
