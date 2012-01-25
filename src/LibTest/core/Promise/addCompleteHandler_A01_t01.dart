/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addCompleteHandler(void completeHandler(T result))
 * Register a normal continuation to execute when the value is available.
 * @description Checks handler invocation.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  var result = 23;
  var visited = false;
  var p = new Promise();

  p.addCompleteHandler(foo(val) {
    Expect.isFalse(visited);
    Expect.equals(val, result);
    visited = true;
  });

  p.complete(result);

  Expect.isTrue(visited);
}
