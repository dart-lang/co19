/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addCancelHandler(void cancelHandler())
 * Register a handler to execute when [cancel] is called.
 * @description Checks that callback is invoked when added to already cancelled promise.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  Promise p = new Promise();
  p.cancel();
  var visited = false;

  p.addCancelHandler(foo() { visited = true; });
  Expect.isTrue(visited);
}
