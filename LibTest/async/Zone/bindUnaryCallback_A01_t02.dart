/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZoneUnaryCallback<R, T> bindUnaryCallback<R, T>(
 *                                      R callback(T argument)
 *                                    )
 *    Registers the provided callback and returns a function that will
 * execute in this zone.
 *    Equivalent to:
 * ZoneCallback registered = this.registerUnaryCallback(callback);
 * return (arg) => thin.runUnary(registered, arg);
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

  int callback(int x) {
    throw "callback error";
  }

  ZoneUnaryCallback<int,int> boundCallback =
                                  zone.bindUnaryCallback<int,int>(callback);
  Expect.throws( () => boundCallback(2), (e) => e=="callback error");
  Expect.equals(0, handlerCallCount);
}
