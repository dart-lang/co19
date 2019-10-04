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
 * • A literal symbol.
 * @description Checks that literal symbol can be assigned to a constant
 * variable.
 * @author ilya
 */

const i1 = #foo;

main() {
  i1;
}
