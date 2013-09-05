/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(Object error)})
 * When this future completes with a value, then onValue is called with this value.
 * If this future is already completed then the invocation of onValue is delayed until
 * the next event-loop iteration.
 * @description Checks that [onValue] is called when a future is complete.
 * @author msyabro
 * @reviewer kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  
  asyncStart();
  f.then((fValue) {
    asyncEnd();
  });

  completer.complete(value);
}

main() {
  check(0);
  check('');
  check(false);
  check([]);
  check(new Object());
  check(new Exception());
}
