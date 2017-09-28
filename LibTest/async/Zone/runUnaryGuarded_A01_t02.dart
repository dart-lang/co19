/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void runUnaryGuarded<T>(void action(T argument), T argument)
 *    Executes the given action with argument in this zone and catches
 * synchronous errors.
 *    See runGuarded.
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

  void action(int x) {
    throw "action error";
  }

  zone.runUnaryGuarded<int>(action, 1);
  Expect.equals(1, handlerCallCount);
  Expect.equals("action error", caughtError);
}
