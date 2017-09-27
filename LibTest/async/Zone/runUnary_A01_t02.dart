/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion aR runUnary<R, T>(R action(T argument), T argument)
 *    Executes the given action with argument in this zone.
 *    As run except that action is called with one argument instead of none.
 * @description Checks that synchronous [action] exceptions are not caught
 * in zone.
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  int handlerCallCount = 0;

  void handler(Zone self, ZoneDelegate parent, Zone zone, e, st) {
    handlerCallCount++;
  }

  Zone zone = Zone.current.fork(
      specification: new ZoneSpecification(
          handleUncaughtError: handler
      )
  );

  int action(String x) {
    throw "action error";
  }

  Expect.throws(
          () => zone.runUnary<int, String>(action, "2"),
          (e) => e=="action error"
  );
  Expect.equals(0, handlerCallCount);
}
