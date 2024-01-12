// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// factory Timer.periodic(Duration duration, void callback(Timer timer))
/// ...
/// A negative duration is treated the same as [Duration.zero]
///
/// @description Checks that negative duration is accepted and treated as
/// [Duration.zero].
/// @author kaigorodov
/// @issue 54598

import "dart:async";
import "../../../Utils/expect.dart";

check(int durationInMs) {
  bool earlierZeroTimerTriggered = false;
  bool laterZeroTimerTriggered = false;

  // Timer is not started immediately but waits for microtask queue. So the
  // timer can be started with some unpredictable delay. Therefore let's check
  // that it triggers not earlier that previously-scheduled zero-duration timer
  // and not earlier that later-scheduled zero-duration timer
  Timer.periodic(Duration.zero, (timer) {
    earlierZeroTimerTriggered = true;
    timer.cancel();
  });

  Timer.periodic(Duration(milliseconds: durationInMs), (Timer timer) {
    Expect.isTrue(earlierZeroTimerTriggered);
    Expect.isFalse(laterZeroTimerTriggered);
    timer.cancel();
  });

  Timer.periodic(Duration.zero, (timer) {
    laterZeroTimerTriggered = true;
    timer.cancel();
    asyncEnd();
  });
}

main() {
  asyncStart(4);
  check(0);
  check(-10);
  check(-100);
  check(-1000);
}
