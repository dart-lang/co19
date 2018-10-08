/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamSubscription<T> listen(void onData(T event),
 *   {Function onError, void onDone(), bool cancelOnError})
 * The onError callback must be of type void onError(error) or
 * void onError(error, StackTrace stackTrace). If onError accepts two
 * arguments it is called with the stack trace (which could be null if the
 * stream itself received an error without stack trace). Otherwise
 * it is called with just the error object.
 * @description Checks that stack trace is null if the stream received
 * an error without stack trace.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Error error = new Error();
  Stream s = new Stream.fromFuture(new Future.error(error));

  asyncStart();

  s.listen((_) {
    Expect.fail('unexpected call to onData');
  }, onError: (e, st) {
    Expect.identical(error, e);
    Expect.isNull(st);
    asyncEnd();
  });
}
