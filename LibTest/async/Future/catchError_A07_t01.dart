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
 * @description Checks that it is a runtime error if [onError] callback has more
 * than two parameters.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

f() {
    // In strong mode, registering incompatible callback is synchronous error,
    // future ends up with no error handler that will lead to async exception
    // with error object equal to 1.
    Expect.throws(() => new Future.error(1).catchError((x, y, z) {}));
}

main() {
  asyncStart();
  runZoned(f, onError: (e) {
    Expect.equals(1, e);
    asyncEnd();
  });
}
