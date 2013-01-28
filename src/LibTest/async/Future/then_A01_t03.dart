/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(AsyncError asyncError)})
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

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  completer.complete(1);

  bool visited1 = false;
  f.then((fValue) {
    visited1 = true;
  });
  Expect.isFalse(visited1);

  bool visited2 = false;
  f = new Future.immediate(1);
  f.then((fValue) {
    visited2 = true;
    Expect.equals(1, fValue);
  });
  Expect.isFalse(visited2);
  
  new Future.delayed(0, (){
    Expect.isTrue(visited1);
    Expect.isTrue(visited2);
  });
  
}
