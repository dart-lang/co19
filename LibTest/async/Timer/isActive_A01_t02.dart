// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final bool isActive
/// Returns whether the timer is still active.
/// A non-periodic timer is active if the callback has not been executed,
/// and the timer has not been canceled.
/// A periodic timer is active if it has not been canceled.
/// @description Checks that for periodic timer, isActive is true if timer has
/// not been canceled.
/// @author ilya

import "dart:async";
import "../../../Utils/expect.dart";

check(int delay) {
  int times = 5;
  int count = 0;

  asyncStart();
  Timer t = new Timer.periodic(durationInMilliseconds(delay), (Timer timer) {
    count++;
    Expect.isTrue(timer.isActive);
    if (count == times) {
      timer.cancel();
      Expect.isFalse(timer.isActive);
      asyncEnd();
    }
  });

  Expect.isTrue(t.isActive);
}

main() {
  asyncStart();
  check(10);
  check(1);
  check(0);
  check(-1);
  check(-10);
  asyncEnd();
}
