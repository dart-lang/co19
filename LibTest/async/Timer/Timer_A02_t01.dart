/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Timer(Duration duration, void callback())
 * A negative duration is treated the same as a duration of 0.
 * @description Checks that negative duration is accepted.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

check(int delayms) {
  bool seen = false;

  asyncStart();
  new Timer(durationMs(delayms), () {
    Expect.isFalse(seen);
    seen = true;
    asyncEnd();
  });
}

main() {
  check(0);
  check(-1);
  check(-10);
  check(-100);
}
