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
 * @description Checks on empty list
 * @reviewer kaigorodov
 * @author msyabro
 */


main() {
  var p = new Promise();
  p.join([], bool joinDone(p) {
    return true;
  });

  Expect.isFalse(p.isDone());
  Expect.isFalse(p.isCancelled());
}
