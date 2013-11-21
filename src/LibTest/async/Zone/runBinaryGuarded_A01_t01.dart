/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract dynamic runBinaryGuarded(f(arg1, arg2), arg1, arg2)
 * Executes the given callback f in this zone.
 * Same as runBinary but catches uncaught errors and gives them to
 * handleUncaughtError. 
 * @description Checks that f is run in this zone with provided args and that
 * uncaught errors are passed to handleUncaughtError.
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
  var res = z.runBinaryGuarded((x,y) {
    Expect.equals(z, Zone.current);
    return x+y;
  }, 1, 2);

  Expect.equals(3, res);

  z.runBinaryGuarded((x,y) {
    throw 0;
  }, 1, 2);
}

main() {
  test(newErrorZone(Zone.current));
  test(newErrorZone(Zone.current.fork()));
}
