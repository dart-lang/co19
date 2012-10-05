/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The is-expression tests if an object is a member of a type.
 * typeTest:
 *  isOperator type
 * ;
 * isOperator:
 *   is '!'?
 * ;
 * @description Checks that there is no compile-time error if
 * using a type in the left part of the expression
 * @author kaigorodov 
 */

main() {
  Expect.isTrue(int is Type);
  Expect.isTrue(int is Type<int>);
  Expect.isFalse(int is Type<bool>);
}
