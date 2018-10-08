/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static final Zone current
 * @description Checks that current returns different values for different
 * zones
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Zone zone = Zone.current;

  runZoned(() {
    Expect.notEquals(zone, Zone.current);
  });

  zone.fork().run(() {
    Expect.notEquals(zone, Zone.current);
  });
}
