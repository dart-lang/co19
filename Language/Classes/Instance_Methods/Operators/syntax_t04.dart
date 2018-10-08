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
 * @description Checks that it is a compile-time error if a class defines an
 * operator without a formal parameter list.
 * @author iefremov
 * @compile-error
 */

class C {
  int operator - {}
}

main() {
  try {
    C c = new C();
    var x = -c;
  } catch (x) {}
}
