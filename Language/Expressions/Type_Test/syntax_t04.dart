/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The is-expression tests if an object is a member of a type.
 * typeTest:
 *   isOperator type
 * ;
 * isOperator:
 *   is '!'?
 * ;
 * @description Checks that there is no compile-time error when the first
 * operand of a type test expression is a type alias name.
 * @author kaigorodov
 * @reviewer rodionov
 */

typedef f();

main() {
  f is Type;
}
