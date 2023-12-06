// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion factory Timer(Duration duration, void callback())
/// Creates a new timer.
/// The callback is invoked after the given duration.
///
/// @description Checks that callback function is called after the given
/// duration.
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
  Duration delay = durationInMilliseconds(delayms);
  Stopwatch sw = new Stopwatch();
  sw.start();

  asyncStart();
  new Timer(delay, () {
    Duration actual = sw.elapsed;
    Expect.isTrue(delay <= actual + safetyMargin,
        "expected=$delay, actual=${actual + safetyMargin}");
    asyncEnd();
  });
}

main() {
  asyncStart();
  check(150);
  check(100);
  check(50);
  check(25);
  check(10);
  check(2);
  check(1);
  check(0);
  check(-5);
  check(-50);
  asyncEnd();
}
