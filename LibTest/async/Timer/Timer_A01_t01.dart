/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Timer(Duration duration, void callback())
 * Creates a new timer.
 * The callback callback is invoked after the given duration.
 * @description Checks that callback function is called after the given duration.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

check(int delayms) {
  Duration delay = durationMs(delayms);
  Stopwatch sw = new Stopwatch();
  sw.start();

  asyncStart();
  new Timer(delay, () {
    Duration actual = sw.elapsed;
    Expect.isTrue(delay<=actual, "expected=$delay, actual=$actual");
    asyncEnd();
  });
}

main() {
  check(25);
  check(10);
  check(2);
  check(1);
  check(0);
  check(-5);
}
