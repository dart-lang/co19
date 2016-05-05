/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.microtask(dynamic computation())
 * Creates a future containing the result of calling computation
 * asynchronously with scheduleMicrotask.
 * If executing computation throws, the returned future is completed with the
 * thrown error.
 * If calling computation returns a Future, completion of the created future
 * will wait until the returned future completes, and will then complete with
 * the same result.
 * If calling computation returns a non-future value, the returned future is
 * completed with that value.
 * @description Checks that if computation() returns a future, the returned
 * future is completed first and then created future is completed with the same
 * result.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var value = [1, 2, 3];
  var completer = new Completer();
  Future future = new Future.microtask(() => completer.future);

  var completer2 = new Completer();
  Future future2 = new Future.microtask(() => completer2.future);

  asyncMultiStart(2);

  future
    .then((x) {
      Expect.isTrue(completer.isCompleted);
      Expect.identical(value, x);
      asyncEnd();
    })
    .catchError((x) {
      Expect.fail('should not be called');
    });

  future2
    .then((x) {
      Expect.fail('should not be called');
    })
    .catchError((x) {
      Expect.isTrue(completer2.isCompleted);
      Expect.identical(value, x);
      asyncEnd();
    });

  completer.complete(value);
  completer2.completeError(value);
}
