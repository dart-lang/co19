/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future(dynamic computation())
 * Creates a future containing the result of calling computation
 * asynchronously with Timer.run.
 * if the result of executing computation throws, the returned future is
 * completed with the error.
 * If the returned value is itself a Future, completion of the created
 * future will wait until the returned future completes, and will then
 * complete with the same result.
 * If a non-future value is returned, the returned future is completed with
 * that value.
 * @description Checks that if computation() returns a future, the returned
 * future is completed first and then created future is completed with the same
 * result.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var value = [1, 2, 3];
  asyncMultiStart(2);
  Future future = new Future(() => new Future.value(value));
  Future future2 = new Future(() => new Future.error(value));

  future.then(
    (x) {
      Expect.identical(value, x);
      asyncEnd();
    }
  );

  future2.then(
    (_) {
      Expect.fail("Created future should complete with error");
    },
    onError: (x) {
      Expect.identical(value, x);
      asyncEnd();
    }
  );
}
