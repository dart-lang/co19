/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract ZoneCallback registerCallback(callback())
 * Registers the given callback in this zone.
 * @description Checks that ZoneCallback is returned and that
 * registerCallback can be overriden by ZoneSpecification.
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

  f() => 0;

  var callback = z.registerCallback(f);

  Expect.isTrue(callback is ZoneCallback);
  Expect.equals(0, callback());
 

  dummy() => 42;

  z.fork(specification: new ZoneSpecification(registerCallback:
        (Zone self, ZoneDelegate parent, Zone zone, f()) => dummy))
      .run(() {
        var callback = Zone.current.registerCallback(f);
        Expect.isTrue(callback is ZoneCallback);
        Expect.equals(42, callback());
      });
}
