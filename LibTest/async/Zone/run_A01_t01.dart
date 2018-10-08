/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion R run<R>(R action())
 *    Executes action in this zone.
 *    By default (as implemented in the ROOT zone), runs action with current
 * set to this zone.
 *    If action throws, the synchronous exception is not caught by the zone's
 * error handler. Use runGuarded to achieve that.
 *    Since the root zone is the only zone that can modify the value of current,
 * custom zones intercepting run should always delegate to their parent zone.
 * They may take actions before and after the call.
 * @description Checks that [action] is run in this zone and that [action]
 * result is returned.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

void test(Zone zone) {
  int result = zone.run<int>(() {
    Expect.equals(zone, Zone.current);
    return 1;
  });

  Expect.equals(1, result);
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
