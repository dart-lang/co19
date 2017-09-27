/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void Function(T) bindUnaryCallbackGuarded<T>(
 *                                  void callback(T argument)
 *                               )
 *    Registers the provided callback and returns a function that will execute
 * in this zone.
 *    When the function executes, errors are caught and treated as uncaught
 * errors.
 *    Equivalent to:
 * ZoneCallback registered = this.registerUnaryCallback(callback);
 * return (arg) => this.runUnaryGuarded(registered, arg);
 * @description Checks that synchronous [callback] errors are caught in zone.
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

  void callback(int x) {
    Expect.equals(1, x);
    throw "callback error";
  }

  void Function(int) boundCallback =
                          zone.bindUnaryCallbackGuarded<int>(callback);
  boundCallback(1);
  Expect.equals(1, handlerCallCount);
  Expect.equals("callback error", caughtError);
}
