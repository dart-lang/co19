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
 * @description Checks that the correct value is passes to [onValue].
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

class C {
  const C();
}

check(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  f.then((fValue) {
    Expect.equals(value, fValue);
  });

  completer.complete(value);
}

main() {
  check(1e98);
  check('value');
  check(true);
  check(const {});
  check(const  C());
}
