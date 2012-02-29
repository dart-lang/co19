/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The return statement returns a result to the caller of a function.
 * returnStatement:
 * return expression? ';'
 * ;
 * @description Checks that the expression in a return statement can be omitted.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

foo() {
  return;
}

main() {
  foo();
}
