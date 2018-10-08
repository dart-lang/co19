/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.delayed(Duration duration, [dynamic computation()])
 *    Creates a future that runs its computation after a delay.
 *    The computation will be executed after the given duration has passed, and
 * the future is completed with the result. If the duration is 0 or less, it
 * completes no sooner than in the next event-loop iteration.
 * @description Checks that a future created with the Future.delayed()
 * has the result returned by the supplied computation() function.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

void check(delay, value) {
  asyncStart();
  new Future.delayed(durationMs(delay), () => value)
    .then((v) {
      Expect.equals(value, v);
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
