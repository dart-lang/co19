/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void runGuarded(void action())
 *    Executes the given action in this zone and catches synchronous errors.
 *    This function is equivalent to:
 * try {
 *    this.run(action);
 * } catch (e, s) {
 *    this.handleUncaughtError(e, s);
 * }
 *    See run.
 * @description Checks that [action] is run in this zone
 * @author ilya
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

void test(Zone zone) {
  Zone actionZone = null;

  void action() {
    actionZone = Zone.current;
  }

  zone.runGuarded(action);
  Expect.equals(zone, actionZone);
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
