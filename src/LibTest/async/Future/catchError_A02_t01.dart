/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future catchError(onError(Object error), {bool test(Object error)})
 * When this completes with a value, the value is forwarded to f unmodified.
 * That is, f completes with the same value.
 * @description Checks that [onError] is not called if a future gets a normal value.
 * @author kaigorodov
 */

import "dart:async";

check(value) {
  Completer completer = new Completer();
  Future f0 = completer.future;
  Future f = f0.catchError((Object asyncError) {
    throw asyncError; // should not be called
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
