// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream.periodic(Duration period,
///     [T computation(int computationCount)])
/// Creates a stream that repeatedly emits events at period intervals.
/// If computation is omitted the event values will all be null.
///
/// @description Checks that created stream emits events at period intervals.
/// Checks that if computation is omitted the event value is null.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";

// Most browsers can trigger timers too early. Test data shows instances where
// timers fire even 15ms early. We add a safety margin to prevent flakiness
// when running this test on affected platforms.
Duration safetyMargin = const bool.fromEnvironment('dart.library.js')
    ? Duration(milliseconds: 40)
    : Duration.zero;

void check(int periodMs) {
  Duration period = durationInMilliseconds(periodMs);
  const int maxCount = 5;
  int count = 0;

  Stopwatch sw = new Stopwatch();
  sw.start();
  asyncStart();
  Stream s = new Stream.periodic(period);
  late StreamSubscription ss;
  ss = s.listen((var event) {
    count++;
    Expect.isNull(event);
    Duration expected = period * count;
    Duration actual = sw.elapsed;
    Expect.isTrue(expected <= actual + safetyMargin,
        "expected=$expected, actual=${actual + safetyMargin}");
    if (count >= maxCount) {
      ss.cancel();
      asyncEnd();
    }
  });
}

main() {
  check(0);
  check(1);
  check(10);
  check(30);
  check(100);
}
