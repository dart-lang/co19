/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract dynamic runUnaryGuarded(f(arg), arg)
 * Executes the given callback f in this zone.
 * Same as runUnary but catches uncaught errors and gives them to
 * handleUncaughtError.
 * @description Checks that f is run in this zone with provided arg and that
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
  var res = z.runUnaryGuarded((x) {
    Expect.equals(z, Zone.current);
    return x;
  }, 1);

  Expect.equals(1, res);

  z.runUnaryGuarded((x) {
    throw 0;
  }, 1);
}

main() {
  test(newErrorZone(Zone.current));
  test(newErrorZone(Zone.current.fork()));
}
