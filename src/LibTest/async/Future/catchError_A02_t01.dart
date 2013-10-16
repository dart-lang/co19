/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future catchError(onError(Object error), {bool test(Object error)})
 * When this completes with a value, the value is forwarded to f unmodified.
 * That is, f completes with the same value.
 * @description Checks that if this completes with a value, [onError] is not
 * called and a future gets the same value.
 * value.
 * @author kaigorodov
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

check(value) {
  Completer completer = new Completer();
  Future f0 = completer.future;

  asyncStart();
  Future f = f0.catchError((Object asyncError) {
    throw asyncError; // should not be called
  }).then((x) {
    Expect.identical(value, x);
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
