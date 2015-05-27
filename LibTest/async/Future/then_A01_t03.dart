/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(Object asyncError)})
 * When this future completes with a value, then onValue is called with this value.
 * If this future is already completed then the invocation of onValue is delayed until
 * the next event-loop iteration.
 * Returns a new Future f which is completed with the result of invoking onValue
 * (if this completes with a value) or onError (if this completes with an error).
 * @description Checks that if this future is already completed, then the invocation of
 * onValue is delayed until the next event-loop iteration.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
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
