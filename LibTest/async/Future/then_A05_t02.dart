/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future then(dynamic onValue(T value), {Function onError})
 * If onError is provided, and this future completes with an error, the onError
 * callback is called with that error and its stack trace. The onError callback
 * must accept either one argument or two arguments. If onError accepts two
 * arguments, it is called with both the error and the stack trace, otherwise
 * it is called with just the error object.
 * @description Checks that second parameter to onError callback will receive
 * a stack trace.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Future future;
  var stackTrace;
  var error = new Error();

  asyncStart();

  try {
    throw error;
  } catch(e, st) {
    stackTrace = st;
    future = new Future.error(e, st);
  }

  future.then((_) {}, onError: (e, st) {
    Expect.identical(error, e);
    Expect.identical(stackTrace, st);
    asyncEnd();
  });
}
