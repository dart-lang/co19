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

const int value = 123;

check(Future f) {
  bool seen = false;
  Stream s = new Stream.fromFuture(f);

  asyncStart();

  s.listen((int event) {
    Expect.equals(false, seen, "onData");
    Expect.equals(value, event);
    seen = true;
  }, onError: (_) {
    Expect.fail("onError called unexpectedly");
  }, onDone: () {
    Expect.equals(true, seen, "onDone");
    asyncEnd();
  });
}

main() {
  // using immediate sync future
  check(new Future.sync(() => value));

  // using immediate future
  check(new Future(() => value));

  // using completable future
  Completer completer = new Completer();
  check(completer.future);
  completer.complete(value);
}

