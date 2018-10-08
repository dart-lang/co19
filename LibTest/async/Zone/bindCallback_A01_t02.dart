/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZoneCallback<R> bindCallback<R>(
 *                 R callback()
 *            )
 * Registers the provided callback and returns a function that will execute
 * in this zone.
 * Equivalent to:
 *    ZoneCallback registered = this.registerCallback(callback);
 *    return () => this.run(registered);
 * @description Checks that synchronous [callback] errors are not caught by zone.
 * @author ilya
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

  int callback() {
    throw "callback error";
  }

  ZoneCallback<int> boundCallback = zone.bindCallback<int>(callback);
  Expect.throws(() => boundCallback(), (e) => e == "callback error");
  Expect.equals(0, handlerCallCount);
}
