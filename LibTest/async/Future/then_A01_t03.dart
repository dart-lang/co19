/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future then(dynamic onValue(T value), {Function onError})
 *    Register callbacks to be called when this future completes.
 *    When this future completes with a value, the onValue callback will be
 * called with that value. If this future is already completed, the callback
 * will not be called immediately, but will be scheduled in a later microtask.
 * . . .
 *    Returns a new Future which is completed with the result of the call to
 * onValue (if this future completes with a value) or to onError (if this
 * future completes with an error).
 * @description Checks that if this future is already completed, then the
 * invocation of onValue is delayed until the next event-loop iteration.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

void check(Future f) {
  bool visited = false;
  f.then((fValue) {
    visited = true;
    Expect.equals(1, fValue);
    asyncEnd();
  });
  Expect.isFalse(visited);
}

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  asyncStart();
  completer.complete(1);
  check(f);

  f = new Future.value(1);
  asyncStart();
  check(f);
}
