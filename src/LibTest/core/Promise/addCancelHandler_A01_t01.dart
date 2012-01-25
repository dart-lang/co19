/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addCancelHandler(void cancelHandler())
 * Register a handler to execute when [cancel] is called.
 * @description Checks handler invocation.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  var visited = false;
  var p = new Promise();

  p.addCancelHandler(foo() {
    Expect.isFalse(visited);
    visited = true;
  });
  p.cancel();
  Expect.isTrue(visited);
}
