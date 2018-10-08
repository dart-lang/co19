/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> whenComplete(action())
 * If the call to action returns a Future, f2, then completion of f is delayed
 * until f2 completes. If f2 completes with an error, that will be the result
 * of f too.
 * @description Checks that if the call to action returns a Future, f2, then
 * completion of f is delayed until f2 completes. Checks that if f2 completes
 * with an error, that will be the result of f too.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  int value = 20;

  Completer completer = new Completer();
  Future f0 = completer.future;
  Completer completer2 = new Completer();
  Future f2 = completer2.future;
  Future f = f0.whenComplete(() {return f2;});

  asyncStart();
  f.then(
      (var v) {
        Expect.fail("Returned future should complete with error");
      },
      onError: (Object e) {
        Expect.equals(value, e);
        asyncEnd();
      }
  );

  completer.complete(1);

  completer2.completeError(value);
}

