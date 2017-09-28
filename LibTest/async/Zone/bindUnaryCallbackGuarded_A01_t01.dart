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
 * @description Checks that [callback] is run in the zone it was bound to.
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Zone zone = Zone.current;
  Zone callbackZone = null;

  void callback(int x) {
    callbackZone = Zone.current;
  }

  void Function(int) boundCallback =
                                  zone.bindUnaryCallbackGuarded<int>(callback);

  runZoned(() {
    boundCallback(3);
  });
  Expect.equals(zone, callbackZone);
}
