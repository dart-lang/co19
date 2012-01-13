/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void waitFor(Collection<Promise> arr, int n)
 * Mark this promise as complete when [n] promises in [arr] complete, then
 * cancel the rest of the promises in [arr] that didn't complete.
 * @description Checks on empty list
 * @author msyabro
 */

check(int size) {
  var p = new Promise();
  p.waitFor([], size);
  Expect.isFalse(p.hasError());
  Expect.isFalse(p.isCancelled());
  Expect.isFalse(p.isDone());
}

main() {
  check(0);
  check(10);
  check(-1);
}
