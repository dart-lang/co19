/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isActive
 * Returns whether the timer is still active.
 * A non-periodic timer is active if the callback has not been executed,
 * and the timer has not been canceled.
 * A periodic timer is active if it has not been canceled.
 * @description Checks that for non-periodic timer, isActive is true just after
 * timer creation, and false when callback is called.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

check(int delayms) {

  asyncStart();
  Timer t;
  t = new Timer(durationMs(delayms), () {
    Expect.isFalse(t.isActive);
    asyncEnd();
  });

  Expect.isTrue(t.isActive);
}

main() {
  check(10);
  check(1);
  check(0);
  check(-1);
  check(-10);
}
