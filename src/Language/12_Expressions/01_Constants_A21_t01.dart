/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form e1?e2:e3 where where e1, e2 and e3
 * are constant expressions and e1 evaluates to a boolean value is a constant expression.
 * @description Checks that various conditional expressions with constant
 * operands are constant expressions.
 * @author ilya
 */

const x = false;
const y = !x ? true : x;

class C {
  const C();
}

const list = const [
  x ? 1 : 0,
  (y==y && x==x) ? (!x ? const C() : null) : (y ? y : y)
];
  
main() {
  print(list);
}
