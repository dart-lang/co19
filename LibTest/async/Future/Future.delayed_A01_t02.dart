// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future.delayed(Duration duration, [dynamic computation()])
///    Creates a future that runs its computation after a delay.
///    The computation will be executed after the given duration has passed, and
/// the future is completed with the result. If the duration is 0 or less, it
/// completes no sooner than in the next event-loop iteration.
///
/// @description Checks that execution of the supplied computation() function
/// happens after delay.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";

// Most browsers can trigger timers too early. Test data shows instances where
// timers fire even 15ms early. We add a safety margin to prevent flakiness
// when running this test on affected platforms.
Duration safetyMargin = const bool.fromEnvironment('dart.library.js')
    ? Duration(milliseconds: 40)
    : Duration.zero;

check(delayms, value) {
  Duration delay = durationInMilliseconds(delayms);
  Stopwatch sw = new Stopwatch();
  asyncStart();
  sw.start();
  new Future.delayed(delay, () {
    Duration elapsed = sw.elapsed;
    Expect.isTrue(
        elapsed + safetyMargin >= delay, "delay=$delay, elapsed=$elapsed");
    asyncEnd();
  });
}

main() {
  check(0, 11);
  check(300, 3);
  check(50, 22);
}
