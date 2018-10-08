/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> whenComplete(action())
 * The future returned by this call, f, will complete the same way as this
 * future unless an error occurs in the action call, or in a Future returned by
 * the action call. If the call to action does not return a future, its return
 * value is ignored.
 * @description Checks that the future returned by this call, f,
 * will complete the same way as this future, if no error occurs.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  int value = 20;

  Completer completer = new Completer();
  Future f0 = completer.future;
  Future f = f0.whenComplete(() {});

  asyncStart();
  completer.complete(value);

  f.then((value2) {
    Expect.equals(value, value2);
    asyncEnd();
  });
}

