/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion aR runUnary<R, T>(R action(T argument), T argument)
 *    Executes the given action with argument in this zone.
 *    As run except that action is called with one argument instead of none.
 * @description Checks that [action] is run in this zone with provided arg.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

void test(Zone zone) {
  int result = zone.runUnary<int, int>(
    (int x) {
      Expect.equals(zone, Zone.current);
      return x;
    },
    1
  );

  Expect.equals(1, result);
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
