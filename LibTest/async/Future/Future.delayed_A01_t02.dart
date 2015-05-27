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
 * @description Checks that execution of the supplied computation() function
 * happens after delay.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(delayms, value) {
  Duration delay=durationMs(delayms);
  Stopwatch sw=new Stopwatch();
  sw.start();
  asyncStart();
  Future future = new Future.delayed(delay, (){
    Duration elapsed=sw.elapsed;
    Expect.isTrue(elapsed >= delay, "delay=$delay, elapsed=${elapsed}");
    asyncEnd();
  });
}

main() {
  check(0, 11);
  check(300, 3);
  check(50, 22);
}
