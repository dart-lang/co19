/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void Function() bindCallbackGuarded(void callback())
 *    Registers the provided callback and returns a function that will execute
 * in this zone.
 *    When the function executes, errors are caught and treated as uncaught
 * errors.
 *    Equivalent to:
 *  ZoneCallback registered = this.registerCallback(callback);
 *  return () => this.runGuarded(registered);
 * @description Checks that [callback] is run in the zone it was bound to.
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Zone zone = Zone.current;
  Zone callbackZone = null;

  void Function() boundCallback = zone.bindCallbackGuarded(() {
    callbackZone = Zone.current;
  });

  runZoned(() {
    boundCallback();
  });
  Expect.equals(zone, callbackZone);
}
