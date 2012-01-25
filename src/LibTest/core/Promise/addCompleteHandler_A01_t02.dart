/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addCompleteHandler(void completeHandler(T result))
 * Register a normal continuation to execute when the value is available.
 * @description Checks that callback is invoked when added to already completed promise.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


var result;

check(p) {
  Expect.equals(p.value, result);

  var visited = false;

  p.addCompleteHandler(foo(val) {
    visited = true;
    Expect.equals(val, result);
  });

  Expect.isTrue(visited);  
}

main() {
  result = 17;

  Promise p = new Promise();
  p.complete(result);
  check(p);

  p = new Promise.fromValue(result);
  check(p);
}
