/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.fromFuture(Future<T> future)
 * When the future completes, the stream will fire one event, either data or
 * error, and then close with a done-event.
 * @description Checks that if the future completes normally, the stream will
 * fire one data event, and then close with a done-event.
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
      eventCount++;
      actual = event;
    },
    onError: (_) {
      Expect.fail("onError called unexpectedly");
    },
    onDone: () {
      Expect.equals(1, eventCount);
      Expect.equals(expected, actual);
      asyncEnd();
    }
  );
}

main() {
  // using immediate sync future
  check(new Future.sync(() => 123), 123);

  // using immediate future
  check(new Future(() => "abc"), "abc");

  // using completable future
  Completer completer = new Completer();
  check(completer.future, 3.14);
  completer.complete(3.14);
}
