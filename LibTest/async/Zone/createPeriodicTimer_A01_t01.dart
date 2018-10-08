/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Timer createPeriodicTimer(Duration period,
 *    void callback(Timer timer))
 * Creates a periodic Timer where the callback is executed in this zone.
 * @description Checks that periodic timer is created and that callback
 * is executed in this zone.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

void test(Zone zone) {
  int count=0;
  Timer timer;

  asyncStart();
  timer = zone.createPeriodicTimer(new Duration(milliseconds: 10), (_timer) {
    Expect.equals(timer,_timer);
    Expect.equals(zone, Zone.current);
    if (++count > 5) {
      _timer.cancel();
      asyncEnd();
    }
  });
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
