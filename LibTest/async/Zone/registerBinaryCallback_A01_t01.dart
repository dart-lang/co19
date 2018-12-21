/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZoneBinaryCallback<R, T1, T2> registerBinaryCallback<R, T1, T2>(
 *                                                R callback(T1 arg1, T2 arg2)
 *                                          )
 * Registers the given callback in this zone.
 * @description Checks that ZoneBinaryCallback is returned and that
 * registerBinaryCallback can be overridden by ZoneSpecification.
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

  int f(int x, int y) => x + y;

  ZoneBinaryCallback<int, int, int> callback =
    z.registerBinaryCallback<int, int, int>(f);

  Expect.isTrue(callback is ZoneBinaryCallback<int, int, int>);
  Expect.equals(3, callback(1, 2));

  ZoneBinaryCallback<R, T1, T2> registerFunction<R, T1, T2>(
      Zone self, ZoneDelegate parent, Zone zone,R f(T1 arg1, T2 arg2)) {
    return (_, __) => 42 as R;
  }

  z.fork(specification: new ZoneSpecification(
      registerBinaryCallback: registerFunction))
      .run(() {
        ZoneBinaryCallback<int, int, int> callback =
          Zone.current.registerBinaryCallback<int, int, int>(f);
        Expect.isTrue(callback is ZoneBinaryCallback<int, int, int>);
        Expect.equals(42, callback(1, 2));
      });
}
