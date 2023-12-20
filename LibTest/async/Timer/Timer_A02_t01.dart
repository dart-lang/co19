// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion factory Timer(Duration duration, void callback())
///
/// A negative duration is treated the same as a duration of 0.
///
/// @description Checks that negative duration is accepted.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";

// Most browsers can trigger timers too early. Test data shows instances where
// timers fire even 15ms early. We add a safety margin to prevent flakiness
// when running this test on affected platforms.
Duration safetyMargin = const bool.fromEnvironment('dart.library.js')
    ? Duration(milliseconds: 40)
    : Duration.zero;

check(int delayms) {
  Stopwatch sw = new Stopwatch();
  sw.start();

  asyncStart();
  new Timer(durationInMilliseconds(delayms), () {
    Duration expected = durationInMilliseconds(40); // Expect actual time near 0
    Duration actual = sw.elapsed;
    Expect.isTrue(actual <= expected + safetyMargin,
        "expected=${expected + safetyMargin}, actual=$actual");
    asyncEnd();
  });
}

main() {
  asyncStart();
  check(0);
  check(-1);
  check(-10);
  check(-100);
  check(-1000);
  asyncEnd();
}
