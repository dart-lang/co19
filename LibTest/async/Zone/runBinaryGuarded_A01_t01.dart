/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion avoid runBinaryGuarded<T1, T2>(
 *                                    void action(T1 argument1, T2 argument2),
 *                                    T1 argument1,
 *                                    T2 argument2
 *                  )
 *    Executes the given action with argument1 and argument2 in this zone
 * and catches synchronous errors.
 *    See runGuarded.
 * @description Checks that [action] is run in this zone with provided args.
 * @author ilya
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

void test(Zone zone) {
  Zone actionZone = null;

  void action(int x, int y) {
    actionZone = Zone.current;
  }

  zone.runBinaryGuarded<int, int>(action, 1, 2);
  Expect.equals(zone, actionZone);
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
