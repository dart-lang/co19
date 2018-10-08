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
 * @description Checks that [callback] is run in the zone it was bound to.
 * @author ilya
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Zone zone = Zone.current;
  Zone callbackZone = null;

  ZoneCallback<int> boundCallback = zone.bindCallback<int>(() {
    callbackZone = Zone.current;
    return 1;
  });
  int result = null;
  runZoned(() {
    result = boundCallback();
  });
  Expect.equals(1, result);
  Expect.equals(zone, callbackZone);
}
