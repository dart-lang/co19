/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.sync(computation())
 * Creates a future containing the result of immediately calling computation.
 * if the result of executing computation throws, the returned future is completed with the error.
 * If the returned value is itself a Future, completion of the created future
 * will wait until the returned future completes, and will then complete with the same result.
 * @description Checks that a future created with constructor
 * Future.sync has the value of immediately calling computation.
 * @author kaigorodov
  TODO make more tests
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(value) {
  Future future = new Future.sync(()=>value);
  
  asyncStart();
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
