/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract ZoneBinaryCallback bindBinaryCallback(f(arg1, arg2),
 *    {bool runGuarded: true})
 * @description Checks expected effect of runGuarded parameter and that
 * default is true.
 * @author ilya
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

handler(Zone self, ZoneDelegate parent, Zone zone, e, st) {
  Expect.equals(1, e);
}

main() {
  var z = Zone.current.fork(specification: new ZoneSpecification(
        handleUncaughtError: handler));

  var bound = z.bindBinaryCallback((x,y) => throw 1);
  
  bound(1,2);

  bound = z.bindBinaryCallback((x,y) => throw 1, runGuarded:true);
  
  bound(1,2);

  var boundThrows = z.bindBinaryCallback((x,y) => throw 1, runGuarded:false);

  Expect.throws(() => boundThrows(1,2));
}
