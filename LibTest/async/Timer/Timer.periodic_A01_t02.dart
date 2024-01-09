// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that no more than `n` callbacks are made in
/// `duration * n` time
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

void check(int durationMs, int n) {
  int callbacksCount = 0;
  Duration duration = Duration(milliseconds: durationMs);
  Stopwatch sw = Stopwatch();

  sw.start();
  Timer.periodic(duration, (Timer timer) {
    callbacksCount++;
    if (sw.elapsedMilliseconds <= n * durationMs) {
      Expect.isTrue(
          callbacksCount <= n,
          "Expected no more than $n callbacks for ${n * durationMs}ms, but " +
              "actually there were $callbacksCount for " +
              "${sw.elapsedMilliseconds}ms");
    } else {
      timer.cancel();
      asyncEnd();
    }
  });
}

void main() {
  asyncStart(4);
  check(1, 5);
  check(10, 5);
  check(50, 5);
  check(100, 5);
}
