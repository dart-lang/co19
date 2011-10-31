/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void waitFor(Collection<Promise> arr, int n)
 * Mark this promise as complete when [n] promises in [arr] complete, then
 * cancel the rest of the promises in [arr] that didn't complete.
 * @description Tries to wait negative number of  promises
 * @author msyabro
 */

main() {
  var p = new Promise();
  List promiseList = new List();
  for(int i = 0; i < 10; i++) {
    promiseList.add(new Promise());
  }
  p.waitFor(promiseList, -1);

  for(int i = 0; i < 10; i++) {
    promiseList[i].complete(1);
  }

  Expect.isFalse(p.isCancelled());
  Expect.isFalse(p.isDone());
}
