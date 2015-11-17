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
 * @description Checks that a function literal cannot be assigned to a constant
 * variable.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

const a = () {};

main() {
  try {
    print(a);
  } catch (x) {}
}
