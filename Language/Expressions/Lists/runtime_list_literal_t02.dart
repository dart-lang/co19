/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A runtime list literal <E>[e1... en] is evaluated as follows:
 * • First, the expressions e1... en are evaluated in order, they appear in the
 *   program, yielding objects o1... on.
 * • A fresh instance a, of size n, whose class implements the built-in class
 *   List<E> is allocated.
 * • The operator []= is invoked on a with first argument i and second argument
 *   oi+1, 0 <= i < n.
 * • The result of the evaluation is a.
 * @description Checks that a fresh instance is allocated every time when
 * evaluating a runtime list literal.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  var m = [1, 2, 3, 4, 5];
  for (int i = 0; i < 10; ++i) {
    var tmp = [1, 2, 3, 4, 5];
    Expect.isFalse(identical(m, tmp)	);
    m = tmp;
  }
}
