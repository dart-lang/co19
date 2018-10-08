/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future catchError(Function onError, {bool test(Object error)})
 *    If this future completes with a value, the returned future completes with
 * the same value.
 * @description Checks that if the future completes with a value, [onError]
 * is not called and returned future is completed with the same value.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(value) {
  Completer completer = new Completer();
  Future f = completer.future;

  asyncStart();
  f.catchError(
    (Object error) {
      Expect.fail("onError should not be called");
    }
  ).then(
    (x) {
      Expect.identical(value, x);
      asyncEnd();
    }
  );

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
