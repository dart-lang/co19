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
 * @description Checks that [callback] is run in the zone it was bound to.
 * @author ilya
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Zone zone = Zone.current;
  Zone callbackZone = null;

  int callback(int x) {
    callbackZone = Zone.current;
    return x * 2;
  }

  ZoneUnaryCallback<int, int> boundCallback =
                                    zone.bindUnaryCallback<int, int>(callback);

  int result = null;
  runZoned(() {
    result = boundCallback(3);
  });
  Expect.equals(6, result);
  Expect.equals(zone, callbackZone);
}
