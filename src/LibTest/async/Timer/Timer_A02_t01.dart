/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Timer(Duration duration, void callback())
 * A negative duration is treated similar to a duration of 0.
 * @description Checks that negative duration is treated similar to a duration of 0,
 * so that timer runs the callback almost immediately.
 * @author kaigorodov
 */

import "dart:async";

import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(delay, value) {
  DateTime start=new DateTime.now();

  void checkTime() {
    DateTime now=new DateTime.now();
    Expect.isTrue(now.difference(start).inMilliseconds<100, "now=$now, start=$start");
    asyncEnd();
  }

  asyncStart();
  new Timer(durationMs(-delay), checkTime);
  asyncStart();
  new Timer(durationMs(0), checkTime);
}

main() {
  check(25, const []);
  check(10, null);
  check(2, '');
  check(1, 1);
}

