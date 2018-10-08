/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeError(Object exception, [Object stackTrace])
 * Complete future with an error. Completing a future with an error indicates
 * that an exception was thrown while trying to produce a value.
 * If error is a Future, the future itself is used as the error value.
 * @description Checks that after [completeError] is called, the corresponding
 * future is completed with that exception.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

List<Future<dynamic>> futures = [];
int count=0;

check(value) {
  var completer = new Completer();
  var future = completer.future;

  completer.completeError(value);

  asyncStart();
  futures.add(future.then(
    (fValue) => Expect.fail('should not get here'),
    onError: (Object asyncError) {
      Expect.equals(value, asyncError);
      count++;
      asyncEnd();
    }
  ));
}

main() {
  check(0);
  check(-5);
  //check(null); // null is disallowed as an argument to completeError()
  check('string');
  check(true);
  check(const {'k1': 1, 'k2': 2});
  Future.wait(futures).whenComplete(() => Expect.equals(5, count));
}
