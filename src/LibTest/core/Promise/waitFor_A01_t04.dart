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
 * from [arr] are completed
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

  p.waitFor(arr, n);

  arr[2].complete(2);
  arr[5].complete(5);
  arr[4].complete(4).
  arr[8].complete(8);

  Expect.isTrue(arr[0].isCancelled());
  Expect.isTrue(arr[1].isCancelled());
  Expect.isTrue(arr[3].isCancelled());
  Expect.isTrue(arr[6].isCancelled());
  Expect.isTrue(arr[7].isCancelled());
  Expect.isTrue(arr[9].isCancelled());

  Expect.isTrue(p.isDone());
  Expect.equals(8, p.value);
}