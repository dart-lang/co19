/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant expression is an expression whose value can never
 * change, and that can be evaluated entirely at compile time.
 * A constant expression is one of the following:
 * . . .
 * • A simple or qualified identifier denoting a top-level function or a static
 *   method that is not qualified by a deferred prefix.
 * @description Checks that an identifier denoting an instance method is not
 * a constant expression.
 * @compile-error
 * @author kaigorodov
 */

class Bad {
  void m() {}

 test() {
   var list = const [m]; //a constant list can contain only constant expressions
 }
}

main() {
  try {
    Bad b = new Bad();
    b.test();
  } catch (x) {}
}
