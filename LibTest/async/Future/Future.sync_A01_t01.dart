/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.sync(dynamic computation())
 * Creates a future containing the result of immediately calling computation.
 * If calling computation throws, the returned future is completed with the
 * error.
 * If calling computation returns a Future, completion of the created future
 * will wait until the returned future completes, and will then complete with
 * the same result.
 * If calling computation returns a non-future value, the returned future is
 * completed with that value.
 * @description Checks that a future created with constructor
 * Future.sync has the value of immediately calling computation.
 * @author kaigorodov
  TODO make more tests
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(value) {
  asyncStart();
  Future future = new Future.sync(() => value);

  future.then((fValue) {
    Expect.equals(fValue, value);
    asyncEnd();
  });
}

main() {
  check(0);
  check(1);
  check(-5);
  check('');
  check('string');
  check(null);
  check(true);
  check(const []);
  check(const {'k1': 1, 'k2': 2});
}
