/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An assert statement is used to disrupt normal execution if a
 * given boolean condition does not hold.
 * assertStatement:
 *   assert '(' conditionalExpression ')' ';'
 * ;
 * @description Checks that there is no compile-time error if there is a second
 * argument in the assert statement
 * @author sgrekhov@unipro.ru
 */

main() {
  assert(true, "");
  assert(true, "Some message");
  assert(true, null);
  assert(true, 1);
  assert(true, new Object());
  assert(true, true);
  assert(true, 3.14);
}
