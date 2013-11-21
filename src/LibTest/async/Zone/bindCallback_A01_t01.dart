/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract ZoneCallback bindCallback(f(), {bool runGuarded: true})
 * @description Checks that f is run in the zone it was bound to.
 * @author ilya
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var z = Zone.current;

  var boundCallback = z.bindCallback(() {
    Expect.equals(z, Zone.current);
    return 1;
  });

  runZoned(() {
    var res = boundCallback();
    Expect.equals(1, res);
  });
}
