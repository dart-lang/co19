/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZoneBinaryCallback<R, T1, T2> bindBinaryCallback<R, T1, T2>(
 *            R callback(T1 argument1, T2 argument2)
 * )
 * Registers the provided callback and returns a function that will execute
 * in this zone.
 * Equivalent to:
 *    ZoneCallback registered = registerBinaryCallback(callback);
 *    return (arg1, arg2) => thin.runBinary(registered, arg1, arg2);
 * @description Checks that [callback] is run in the zone it was bound to.
 * @author ilya
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Zone zone = Zone.current;
  Zone callbackZone = null;
  int callback(int x, int y) {
    callbackZone = Zone.current;
    return x + y;
  }

  ZoneBinaryCallback<int, int, int> boundCallback =
                  zone.bindBinaryCallback<int, int, int>(callback);

  int result = null;
  runZoned(() {
    result = boundCallback(1, 2);
  });
  Expect.equals(3, result);
  Expect.equals(zone, callbackZone);
}
