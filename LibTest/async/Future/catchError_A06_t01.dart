/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future catchError(Function onError, {bool test(Object error)})
 *    If this future completes with an error, then test is first called with
 * the error value.
 *    If test returns false, the exception is not handled by this catchError,
 * and the returned future completes with the same error and stack trace as
 * this future.
 *    If test returns true, onError is called with the error and possibly stack
 * trace, and the returned future is completed with the result of this call in
 * exactly the same way as for then's onError.
 *    If test is omitted, it defaults to a function that always returns true.
 * The test function should not throw, but if it does, it is handled as if
 * the onError function had thrown.
 * @description Checks that an exception is handled in several [catchError]
 * handlers
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(value) {
  Completer completer = new Completer();
  Future f = completer.future;

  asyncMultiStart(2);

  f.catchError(
    (exception) {
      asyncEnd();
    }
  );

  f.then(
    (fValue) {
      Expect.fail("Error is expected");
    },
    onError:(Object asyncError){
      asyncEnd();
    }
  );

  completer.completeError(value);
}

main() {
  check(1);
  check('');
  check({});
  check(false);
}
