/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> whenComplete(action())
 * Register a function to be called when this future completes.
 * The action function is called when this future completes,
 * whether it does so with a value or with an error.
 * This is the asynchronous equivalent of a "finally" block.
 * @description Checks that the action is called both when this future
 * completes with a value or with an error.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  void action() {
    asyncEnd();
  }

  Completer completer = new Completer();
  completer.future.whenComplete(action);
  asyncStart();
  completer.complete(20);

  Completer completer2 = new Completer();
  completer2.future.whenComplete(action).catchError((e) {});
  asyncStart();
  completer2.completeError(22);
}

