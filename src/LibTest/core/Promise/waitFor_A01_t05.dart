/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void waitFor(Collection<Promise> arr, int n)
 * Mark this promise as complete when [n] promises in [arr] complete, then
 * cancel the rest of the promises in [arr] that didn't complete.
 * @description Checks that promise completes if [n] promises
 * from [arr] are completed before calling [:waitFor():]
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  var p = new Promise();
  var n = 4;
  var arr = new List(10);
  for (int i = 0; i < arr.length; i++) {
    arr[i] = new Promise();
  }

  for(int i = 0; i < n; i++) {
    Expect.isFalse(p.isDone());
    arr[i].complete(i);
  }

  p.waitFor(arr, n);

  // checks that unfinished promises are cancelled
  for(int i = n; i < arr.length; i++) {
    Expect.isTrue(arr[i].isCancelled());
  }

  Expect.isTrue(p.isDone());
  Expect.equals(n - 1, p.value);
}
