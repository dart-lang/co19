// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// factory Timer.periodic(Duration duration, void callback(Timer timer))
///
/// Creates a new repeating timer.
///
/// The callback is invoked repeatedly with duration intervals until canceled
/// with the cancel function.
///
/// The exact timing depends on the underlying timer implementation. No more
/// than n callbacks will be made in duration * n time, but the time between two
/// consecutive callbacks can be shorter and longer than duration.
///
/// In particular, an implementation may schedule the next callback, e.g., a
/// duration after either when the previous callback ended, when the previous
/// callback started, or when the previous callback was scheduled for - even if
/// the actual callback was delayed.
///
/// @description Checks that `callback` function is called repeatedly after the
/// given `duration`.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";

// Most browsers can trigger timers too early. Test data shows instances where
// timers fire even 15ms early. We add a safety margin to prevent flakiness
// when running this test on affected platforms.
Duration safetyMargin = const bool.fromEnvironment('dart.library.js')
    ? Duration(milliseconds: 40)
    : Duration.zero;

main() {
  final maxCount = 10;
  int count = 0;
  Duration delay = durationInMilliseconds(20);
  Stopwatch sw = new Stopwatch();
  sw.start();

  asyncStart();
  new Timer.periodic(delay, (Timer timer) {
    count++;
    Duration expected = delay * count;
    Duration actual = sw.elapsed;
    Expect.isTrue(expected <= actual + safetyMargin,
        "expected=$expected, actual=$actual");
    if (count == maxCount) {
      timer.cancel();
      asyncEnd();
    }
  });
}
