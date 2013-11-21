/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract dynamic runBinary(f(arg1, arg2), arg1, arg2)
 * Executes the given callback f with argument arg1 and arg2 in this zone.
 * @description Checks that f is run in this zone with provided args.
 * @author ilya
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

test(Zone z) {
  var res = z.runBinary((x,y) {
    Expect.equals(z, Zone.current);
    return x+y;
  }, 1, 2);

  Expect.equals(3, res);
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
