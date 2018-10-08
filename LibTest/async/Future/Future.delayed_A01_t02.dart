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
 * @description Checks that execution of the supplied computation() function
 * happens after delay.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(delayms, value) {
  Duration delay = durationMs(delayms);
  Stopwatch sw = new Stopwatch();
  asyncStart();
  sw.start();
  new Future.delayed(delay, () {
    Duration elapsed = sw.elapsed;
    Expect.isTrue(elapsed >= delay, "delay=$delay, elapsed=${elapsed}");
    asyncEnd();
  });
}

main() {
  check(0, 11);
  check(300, 3);
  check(50, 22);
}
