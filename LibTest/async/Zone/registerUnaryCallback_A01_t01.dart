/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZoneUnaryCallback<R, T> registerUnaryCallback<R, T>(
 *                                                    R callback(T arg)
 *                                    )
 * Registers the given callback in this zone.
 * @description Checks that ZoneUnaryCallback is returned and that
 * registerUnaryCallback can be overridden by ZoneSpecification.
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

  int f(int x) => x;

  ZoneUnaryCallback<int,int> callback = z.registerUnaryCallback<int,int>(f);

  Expect.isTrue(callback is ZoneUnaryCallback<int,int>);
  Expect.equals(1, callback(1));

  ZoneUnaryCallback<R, T> registerFunction<R, T>(
                    Zone self, ZoneDelegate parent, Zone zone, f(T arg)){
    return (_) => 42 as R;
  }

  z.fork(specification: new ZoneSpecification(registerUnaryCallback:registerFunction))
      .run(() {
        ZoneUnaryCallback<int,int> callback = Zone.current.registerUnaryCallback<int,int>(f);
        Expect.isTrue(callback is ZoneUnaryCallback<int,int>);
        Expect.equals(42, callback(1));
      });
}
