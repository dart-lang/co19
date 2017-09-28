/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion R runBinary<R, T1, T2>(
 *                                    R action(T1 argument1, T2 argument2),
 *                                    T1 argument1,
 *                                    T2 argument2
 *                                   )
 *    Executes the given action with argument1 and argument2 in this zone.
 *    As run except that action is called with two arguments instead of none.
 * Executes the given callback f with argument arg1 and arg2 in this zone.
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

  int action(int x, String y) {
    throw "action error";
  }

  Expect.throws(
          () => zone.runBinary<int, int, String>(action, 1, "2"),
          (e) => e=="action error"
  );
  Expect.equals(0, handlerCallCount);
}
