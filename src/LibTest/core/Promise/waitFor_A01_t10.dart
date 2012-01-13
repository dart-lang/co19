/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void waitFor(Collection<Promise> arr, int n)
 * Mark this promise as complete when [n] promises in [arr] complete, then
 * cancel the rest of the promises in [arr] that didn't complete.
 * @description Checks that cancel of 'this' will cancel every [arr] promise.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Though such behavior is not specified, current implementation
 * inherits it from [:join():].
 */


main() {
  // checks cancel()
  Promise p = new Promise();

  List promises = new List(10);

  for (int i = 0; i < promises.length; i++) {
    promises[i] = new Promise();
  }

  p.waitFor(promises, 5);

  p.cancel();

  for (int i = 0; i < promises.length; i++) {
    Expect.isTrue(promises[i].isCancelled());
  }
}
