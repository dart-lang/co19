/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Timer createTimer(Duration duration, void callback())
 * Creates a Timer where the callback is executed in this zone.
 * @description Checks that timer is created and that callback
 * is executed in this zone.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

void test(Zone zone) {
  int count = 0;
  Timer timer;

  asyncStart();
  timer = zone.createTimer(new Duration(milliseconds: 10), () {
    Expect.isTrue(timer is Timer);
    Expect.equals(zone, Zone.current);
    if (count++ > 0) {
      Expect.fail('Timer should not be periodic');
    }
    asyncEnd();
  });
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
