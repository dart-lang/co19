/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applying an expression of type Never in the function position of a
 * function call produces a result of type Never.
 *
 * @description Checks that applying an expression of type Never in the function
 * position of a function call produces a result of type Never.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

void test(var x) {
  if (x is Never) {
    Never n1 = x();
    Never n2 = x(42);
  }
}

main() {
  test(null);
}
