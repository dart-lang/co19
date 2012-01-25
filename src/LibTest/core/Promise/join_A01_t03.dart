/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void join(Collection<Promise<T>> arr, bool joinDone(Promise<T> completed))
 * Mark this promise as complete when some or all values in [arr] are
 * computed. Every time one of the promises is computed, it is passed to
 * [joinDone]. When [joinDone] returns true, this instance is marked as
 * complete with the last value that was computed.
 * @description Checks that [:cancel():] will cancel all joined promises.
 * @author pagolubev
 * @reviewer msyabro
 * @needsreview Case is not documented.
 */


main() {
  var numPromises = 10;

  var promises = new List(numPromises);

  for (int i = 0; i < numPromises; i++) {
    promises[i] = new Promise();
  }

  var p = new Promise();
  
  p.join(promises, foo(p) {});

  p.cancel();

  for (int i = 0; i < promises.length; i++) {
    Expect.isTrue(p.isCancelled());
  }
}
