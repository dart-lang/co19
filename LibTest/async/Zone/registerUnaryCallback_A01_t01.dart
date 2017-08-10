/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract ZoneUnaryCallback registerUnaryCallback(callback(arg))
 * Registers the given callback in this zone.
 * @description Checks that ZoneUnaryCallback is returned and that
 * registerUnaryCallback can be overriden by ZoneSpecification.
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

  f(x) => x;

  var callback = z.registerUnaryCallback(f);

  Expect.isTrue(callback is ZoneUnaryCallback);
  Expect.equals(1, callback(1));

  ZoneUnaryCallback<R, T> registerFunction<R, T>(
                    Zone self, ZoneDelegate parent, Zone zone, f(T arg)){
    return (_) => 42 as R;
  }

  z.fork(specification: new ZoneSpecification(registerUnaryCallback:registerFunction))
      .run(() {
        var callback = Zone.current.registerUnaryCallback(f);
        Expect.isTrue(callback is ZoneUnaryCallback);
        Expect.equals(42, callback(1));
      });
}
