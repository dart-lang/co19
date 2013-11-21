/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract dynamic run(f())
 * Executes the given function f in this zone
 * @description Checks that f is run in this zone and that f result is returned.
 * @author ilya
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

test(Zone z) {
  var res = z.run(() {
    Expect.equals(z, Zone.current);
    return 1;
  });

  Expect.equals(1, res);
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
