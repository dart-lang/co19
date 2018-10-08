/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion R runBinary<R, T1, T2>(
 *                                    R action(T1 argument1, T2 argument2),
 *                                    T1 argument1,
 *                                    T2 argument2
 *                                   )
 *    Executes the given action with argument1 and argument2 in this zone.
 *    As run except that action is called with two arguments instead of none.
 * Executes the given callback f with argument arg1 and arg2 in this zone.
 * @description Checks that [action] is run in this zone with provided args.
 * @author ilya
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

void test(Zone zone) {
  int result = zone.runBinary<int,int,String>(
    (int x, String y) {
      Expect.equals(zone, Zone.current);
      return x + int.parse(y);
    },
    1,
    "2"
  );

  Expect.equals(3, result);
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
