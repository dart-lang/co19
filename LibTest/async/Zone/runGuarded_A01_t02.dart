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
 * @description Checks that synchronous [action] exceptions are caught
 * in zone.
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  int handlerCallCount = 0;
  var caughtError = null;

  void handler(Zone self, ZoneDelegate parent, Zone zone, e, st) {
    handlerCallCount++;
    caughtError = e;
  }

  Zone zone = Zone.current.fork(
      specification: new ZoneSpecification(
          handleUncaughtError: handler
      )
  );

  void action() {
    throw "action error";
  }

  zone.runGuarded(action);
  Expect.equals(1, handlerCallCount);
  Expect.equals("action error", caughtError);
}
