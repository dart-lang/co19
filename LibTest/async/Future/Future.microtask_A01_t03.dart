/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.microtask(dynamic computation())
 *    If calling computation returns a Future, completion of the created future
 * will wait until the returned future completes, and will then complete with
 * the same result.
 * @description Checks that if computation() returns a future, the returned
 * future is completed first and then created future is completed with the same
 * result.
 * @author ilya
 */
import "dart:async";
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
    });

  future2.then(
    (x) {
      Expect.fail('created Future should complete with error');
    },
    onError: (x) {
      Expect.isTrue(completer2.isCompleted);
      Expect.identical(value, x);
      asyncEnd();
    }
  );

  completer.complete(value);
  completer2.completeError(value);
}
