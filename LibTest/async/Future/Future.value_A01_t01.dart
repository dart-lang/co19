/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.value([value])
 * A future whose value is available in the next event-loop iteration.
 * If value is not a Future, using this constructor is equivalent to
 * new Future<T>.sync(() => value).
 * @description Checks that a future created with constructor
 * Future.value has the value passed as a parameter.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(value) {
  asyncStart();
  new Future.value(value).then(
    (x) {
      Expect.equals(value, x);
      asyncEnd();
    }
  );
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
