/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZoneCallback<R> registerCallback<R>(R callback())
 * Registers the given callback in this zone.
 * @description Checks that ZoneCallback is returned and that
 * registerCallback can be overridden by ZoneSpecification.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

void test(Zone z) {
  z.run(() {
    Expect.equals(z, Zone.current);
  });
}

main() {
  Zone z = Zone.current;

  int f() => 0;

  ZoneCallback<int> callback = z.registerCallback<int>(f);

  Expect.isTrue(callback is ZoneCallback<int>);
  Expect.equals(0, callback());

  ZoneCallback<R> registerFunction<R>(Zone self, ZoneDelegate parent, Zone zone, R f()) {
    return () => 42 as R;
  }

  z.fork(specification: new ZoneSpecification(registerCallback: registerFunction))
      .run(() {
        ZoneCallback<int> callback = Zone.current.registerCallback<int>(f);
        Expect.isTrue(callback is ZoneCallback<int>);
        Expect.equals(42, callback());
      });
}
