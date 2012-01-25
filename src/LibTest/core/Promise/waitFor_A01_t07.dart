/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void waitFor(Collection<Promise> arr, int n)
 * Mark this promise as complete when [n] promises in [arr] complete, then
 * cancel the rest of the promises in [arr] that didn't complete.
 * @description Tries to cancel all promises in [arr]
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  var p = new Promise();
  List promiseList = new List();
  for(int i = 0; i < 10; i++) {
    promiseList.add(new Promise());
  }
  p.waitFor(promiseList, 5);

  for(int i = 0; i < 10; i++) {
    promiseList[i].cancel();
  }

  Expect.isFalse(p.hasError());
  Expect.isFalse(p.isCancelled());
  Expect.isFalse(p.isDone());
}
