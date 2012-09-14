/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A runtime map literal <String, V>{k1:e1... kn :en}  is evaluated as follows:
 *   - First, the expressions e1...en are evaluated in left to right order, yielding objects o1... on.
 *   - A fresh instance m that implements the built-in interface Map<String, V> is allocated.
 *   - Let ui be the value of the string literal specified by ki.
 *     The operator []= is invoked on m with first argument ui and second argument oi, 0 <= i < n.
 *   - The result of the evaluation is m.
 * @description Checks that a fresh instance is allocated when evaluating a runtime map literal.
 * @author msyabro
 * @needsreview issue 1478
 * @reviewer kaigorodov
 */

main() {
  var m = {"k1": 1, "k2": 2, "k3": 3};
  for(int i = 0; i < 10; ++i) {
    var tmp = {"k1": 1, "k2": 2, "k3": 3};
    Expect.isFalse(m === tmp);
    m = tmp;
  }
}
