/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void runUnaryGuarded<T>(void action(T argument), T argument)
 *    Executes the given action with argument in this zone and catches
 * synchronous errors.
 *    See runGuarded.
 * @description Checks that [action] is run in this zone with provided arg
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

void test(Zone zone) {
  Zone actionZone = null;

  void action(String x) {
    actionZone = Zone.current;
  }

  zone.runUnaryGuarded<String>(action, "a");
  Expect.equals(zone, actionZone);
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
