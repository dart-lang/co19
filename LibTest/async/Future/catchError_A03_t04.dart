/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future catchError(Function onError, {bool test(Object error)})
 * When this completes with an error, test is called with the error's value.
 * If test returns false, the exception is not handled by this catchError, and
 * the returned future completes with the same error and stack trace as this
 * future.
 * If test returns true, onError is called with the error and possibly stack
 * trace, and the returned future is completed with the result of this call in
 * exactly the same way as for then's onError.
 * If test is omitted, it defaults to a function that always returns true. The
 * test function should not throw, but if it does, it is handled as if the the
 * onError function had thrown.
 * @description Checks that stack trace is passed as a second argument to
 * onError callback.
 * @author ilya
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  Future future;
  var stackTtrace;
  var error = new Error();

  asyncStart();

  try {
    throw error;
  } catch (e,st) {
    stackTtrace = st;
    future = new Future.error(e, st);
  }

  future.catchError((e, st) {
    Expect.identical(error, e);
    Expect.identical(stackTtrace, st);
    asyncEnd();
  });
}
