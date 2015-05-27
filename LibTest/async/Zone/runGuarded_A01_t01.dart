/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract dynamic runGuarded(f())
 * Executes the given function f in this zone.
 * Same as run but catches uncaught errors and gives them to
 * handleUncaughtError.
 * @description Checks that f is run in this zone and that uncaught errors
 * are passed to handleUncaughtError.
 * @author ilya
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

errorHandler(Zone self, ZoneDelegate parent, Zone zone, e, st) {
  Expect.equals(0, e);
}

newErrorZone (Zone z) =>
  z.fork(specification: new ZoneSpecification(handleUncaughtError: errorHandler));

test(Zone z) {
  var res = z.runGuarded(() {
    Expect.equals(z, Zone.current);
    return 1;
  });

  Expect.equals(1, res);
  
  z.runGuarded(() {
    throw 0;
  });
}

main() {
  test(newErrorZone(Zone.current));
  test(newErrorZone(Zone.current.fork()));
}
