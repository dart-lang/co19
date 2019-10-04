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
 * • An expression of the form e1?e2:e3 where where e1, e2 and e3 are constant
 *   expressions and e1 evaluates to a boolean value.
 * @description Checks that various conditional expressions with constant
 * operands are constant expressions.
 * @author ilya
 */

import '../../../Utils/expect.dart';

const x = false;
const y = !x ? true : x;

class C {
  const C();
}

const list = const [
  x ? 1 : 0,
  (y == y && x == x) ? (!x ? const C() : null) : (y ? y : y)
];

main() {
  Expect.isTrue(list is List);
}
