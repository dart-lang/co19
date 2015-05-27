/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Stream.fromFuture(Future<T> future)
 * When the future completes, the stream will fire one event, either data or error,
 * and then close with a done-event.
 * @description Checks that if the future completes with error, the stream will fire one error event,
 * and then close with a done-event.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

var error = new Error();

check(Future f) {
  bool seen=false;
  Stream s=new Stream.fromFuture(f);

  asyncStart();

  s.listen((int event) {
    Expect.fail("onData called unexpectedly");
  }, onError: (e) {
    Expect.equals(false, seen, "onError");
    Expect.equals(error, e);
    seen=true;
  }, onDone: () {
    Expect.equals(true, seen, "onDone");
    asyncEnd();
  });
}

main() {
  // using immediate sync future
  void throwError(){throw error;}
  check(new Future.sync(throwError));
  
  // using immediate future
  check(new Future(throwError));
  
  // using completable future
  Completer completer = new Completer();
  check(completer.future);
  completer.completeError(error);
}

