/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A runtime list literal <E>[e1... en]  is evaluated as follows:
 *   First, the expressions e1... en are evaluated in left to right order, yielding objects o1... on.
 *   A fresh instance a, of size n, that implements the built-in class List<E> is allocated.
 *   The operator []= is invoked on a with first argument i and second argument oi+1, 0 <= i < n.
 *   The result of the evaluation is a.
 * @description Checks that elements in a list literal are evaluated in order from left to right.
 * @author msyabro
 * @reviewer rodionov
 */

var evalOrder;

f(p1) {
  evalOrder = evalOrder.concat(p1.toString());
}

main() {
  evalOrder = "";
  [f(1), f(2), f(3)];
  Expect.equals("123", evalOrder);
}
