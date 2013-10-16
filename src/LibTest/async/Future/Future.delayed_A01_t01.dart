/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.delayed(Duration duration, [T computation()])
 * Creates a future that completes after a delay.
 * The future will be completed after the given duration has passed with the result
 * of calling computation.
 * If the duration is 0 or less, it completes no sooner than in the next event-loop iteration.
 * @description Checks that a future created with the Future.delayed()
 * has the result returned by the supplied computation() function.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(delay, value) {
  Future future = new Future.delayed(durationMs(delay), ()=>value);

  asyncStart();
  future.then((fValue) {
    Expect.equals(value, fValue);
    asyncEnd();
  });
}

main() {
  check(0, 0);
  check(10, 1);
  check(0, -5);
  check(10, '');
  check(0, 'string');
  check(10, null);
  check(0, true);
  check(10, const []);
  check(0, const {'k1': 1, 'k2': 2});
}
