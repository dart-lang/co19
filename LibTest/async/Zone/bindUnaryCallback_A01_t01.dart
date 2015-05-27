/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract ZoneUnaryCallback bindUnaryCallback(f(arg),
 *    {bool runGuarded: true})
 * @description Checks that f is run in the zone it was bound to.
 * @author ilya
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var z = Zone.current;

  var boundCallback = z.bindUnaryCallback((x) {
    Expect.equals(z, Zone.current);
    return x;
  });

  runZoned(() {
    var res = boundCallback(1);
    Expect.equals(1, res);
  });
}
