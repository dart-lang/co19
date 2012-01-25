/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void waitFor(Collection<Promise> arr, int n)
 * Mark this promise as complete when [n] promises in [arr] complete, then
 * cancel the rest of the promises in [arr] that didn't complete.
 * @description Checks that promise completes if last [n] promises
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

  for(int i = arr.length - n; i < arr.length; i++) {
    Expect.isFalse(p.isDone(), "$i");
    arr[i].complete(i);
  }

  // checks that unfinished promises are cancelled
  for(int i = 0; i < arr.length - n - 1; i++) {
    Expect.isTrue(arr[i].isCancelled());
  }

  Expect.isTrue(p.isDone());
  Expect.equals(arr.length - 1, p.value);
}