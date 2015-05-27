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
//import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var z = Zone.current;

  runZoned(() {
    Expect.notEquals(z, Zone.current);
  });

  z.fork().run(() {
    Expect.notEquals(z, Zone.current);
  });
}
