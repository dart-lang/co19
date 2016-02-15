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
 * @description Checks basic grammar.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  1 is int;
  2 is! int;
}
