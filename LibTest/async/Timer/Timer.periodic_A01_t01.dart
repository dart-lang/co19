/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Timer.periodic(Duration duration, void callback(Timer timer))
 * Creates a new repeating timer.
 * The callback is invoked repeatedly with duration intervals until canceled.
 * @description Checks that callback function is called repeatedly after
 * the given duration.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  int times = 10;
  int count = 0;
  Duration delay=durationMs(20);
  Stopwatch sw = new Stopwatch();
  sw.start();

  asyncStart();
  new Timer.periodic(delay, (Timer timer) {
    count++;
    Duration expected = delay * count;
    Duration actual = sw.elapsed;
    Expect.isTrue(expected<=actual, "expected=$expected, actual=$actual");
    if (count==times) {
      timer.cancel();
      asyncEnd();
    }
  });
}
