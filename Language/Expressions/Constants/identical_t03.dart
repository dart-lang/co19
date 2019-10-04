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
 * • An expression of the form identical(e1, e2) where e1 and e2 are constant
 *   expressions and identical is statically bound to the predefined dart
 *   function identical() discussed above.
 * @description Checks that identical() with non constant expressions is not a
 * constant expression.
 * @compile-error
 * @author ilya
 */

var x;
const y = identical(x, x);

main() {
  print(y);
}
