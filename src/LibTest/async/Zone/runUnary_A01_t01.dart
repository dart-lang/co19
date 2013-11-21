/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract dynamic runUnary(f(arg), arg) 
 * Executes the given callback f with argument arg in this zone.
 * @description Checks that f is run in this zone with provided arg.
 * @author ilya
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

test(Zone z) {
  var res = z.runUnary((x) {
    Expect.equals(z, Zone.current);
    return x;
  }, 1);

  Expect.equals(1, res);
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
