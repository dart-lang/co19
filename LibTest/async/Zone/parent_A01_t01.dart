/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Zone parent
 * Returns the parent zone.
 * Returns null if this is the ROOT zone.
 * @description Checks that parent property has expected values.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

var count = 0;
var N = 20;

test(Zone z) {
  z.fork().run(() {
    Expect.equals(z, Zone.current.parent);
    if (++count < N) {
      test(Zone.current);
    }
  });
}

main() {
  Expect.isNull(Zone.root.parent);

  var z = Zone.current;

  runZoned(() {
    Expect.equals(z, Zone.current.parent);
  });

  test(Zone.current);
}
