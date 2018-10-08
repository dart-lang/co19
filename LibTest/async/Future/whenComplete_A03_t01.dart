/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> whenComplete(action())
 * If the call to action throws, then f is completed with the thrown error.
 * @description Checks that if the call to action throws,
 * then f is completed with the thrown error.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  int value = 20;

  Completer completer = new Completer();
  Future f0 = completer.future;
  f0.whenComplete(
    () {
      throw value;
    }
  ).catchError(
    (Object error) {
      Expect.equals(value, error);
      asyncEnd();
    }
  );

  asyncStart();
  completer.complete(0);
}

