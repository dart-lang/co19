/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void Function(T1, T2) bindBinaryCallbackGuarded<T1, T2>(
 *                void callback(T1 argument1,T2 argument2)
 *            )
 * Registers the provided callback and returns a function that will execute
 * in this zone.
 * Equivalent to:
 *    ZoneCallback registered = registerBinaryCallback(callback);
 *    return (arg1, arg2) => this.runBinaryGuarded(registered, arg1, arg2);
 * @description Checks that [callback] is run in the zone it was bound to.
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Zone zone = Zone.current;
  Zone callbackZone = null;
  void callback(int x, int y) {
    callbackZone = Zone.current;
  }

  void Function(int, int) boundCallback =
                  zone.bindBinaryCallbackGuarded<int, int>(callback);

  runZoned(() {
    boundCallback(1,2);
  });
  Expect.equals(zone, callbackZone);
}
