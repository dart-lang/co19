/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.fromFuture(Future<T> future)
 * When the future completes, the stream will fire one event, either data or
 * error, and then close with a done-event.
 * @description Checks that if the future completes with error, the stream will
 * fire one error event, and then close with a done-event.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Future f, Object expected) {
  int eventCount = 0;
  Stream s = new Stream.fromFuture(f);
  Object actual;
  asyncStart();

  s.listen(
    (event) {
      Expect.fail("onData called unexpectedly");
    },
    onError: (error) {
      eventCount++;
      actual = error;
    },
    onDone: () {
      Expect.equals(1, eventCount);
      Expect.equals(expected, actual);
      asyncEnd();
    }
  );
}

main() {
  Error error = new Error();
  // using immediate sync future
  void throwError() {throw error;}
  check(new Future.sync(throwError), error);

  // using immediate future
  check(new Future(throwError), error);

  // using completable future
  Completer completer = new Completer();
  check(completer.future, 123);
  completer.completeError(123);

  check(new Future.error(3.14), 3.14);
}
