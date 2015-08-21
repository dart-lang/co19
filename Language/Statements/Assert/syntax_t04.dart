/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An assert statement is used to disrupt normal execution if a 
 * given boolean condition does not hold.
 * assertStatement:
 * assert '(' conditionalExpression ')' ';'
 * @description Checks that it is a compile-time error when there's an expression list
 * (comma-delimited) in place of the assert expression.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  try {
    assert(true, false);
  } catch(x) {}
}
