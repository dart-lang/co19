/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future then(dynamic onValue(T value), {Function onError})
 * If onError is provided, and this future completes with an error, the onError
 * callback is called with that error and its stack trace. The onError callback
 * must accept either one argument or two arguments. If onError accepts two
 * arguments, it is called with both the error and the stack trace, otherwise
 * it is called with just the error object.
 * @description Checks that onError callback with more than two parameters
 * causes runtime exception.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

f() {
  Completer completer = new Completer();
  Future future = completer.future;

  future.then((x) {}, onError: (x, y, z) {});

  completer.completeError(1);
}

main() {
  asyncStart();
  runZoned(f, onError: (e) {
    asyncEnd();
  });
}
