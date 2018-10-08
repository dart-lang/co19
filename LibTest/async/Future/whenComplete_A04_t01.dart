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
 * completion of f is delayed until f2 completes.
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

  Future f = f0.whenComplete(() => f2);

  asyncStart();
  completer.complete(value);
  f.then((value2) {
    Expect.equals(value, value2);
    asyncEnd();
  });

  completer2.complete(1);
}

