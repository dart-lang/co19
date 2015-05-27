/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract ZoneBinaryCallback registerBinaryCallback(
 *    callback(arg1, arg2))
 * Registers the given callback in this zone.
 * @description Checks that ZoneBinaryCallback is returned and that
 * registerBinaryCallback can be overriden by ZoneSpecification.
 * @author ilya
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

test(Zone z) {
  z.run(() {
    Expect.equals(z, Zone.current);
  });
}

main() {
  var z = Zone.current;

  f(x,y) => x+y;

  var callback = z.registerBinaryCallback(f);

  Expect.isTrue(callback is ZoneBinaryCallback);
  Expect.equals(3, callback(1,2));
 

  dummy(_,__) => 42;

  z.fork(specification: new ZoneSpecification(registerBinaryCallback:
        (Zone self, ZoneDelegate parent, Zone zone, f(arg1, arg2)) => dummy))
      .run(() {
        var callback = Zone.current.registerBinaryCallback(f);
        Expect.isTrue(callback is ZoneBinaryCallback);
        Expect.equals(42, callback(1,2));
      });
}
