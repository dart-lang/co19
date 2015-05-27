/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(Object asyncError)})
 * The onError callback must be of type
 * void onError(error) or
 * void onError(error, StackTrace stackTrace).
 * If onError accepts two arguments it is called with the stack trace
 * (which could be null if the stream itself received an error without stack
 * trace). Otherwise it is called with just the error object.
 * @description Checks that second parameter to onError callback will receive
 * a stack trace.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
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

  future.then((_){}, onError: (e, st) {
    Expect.identical(error, e);
    Expect.identical(stackTrace, st);
    asyncEnd();
  });
}
