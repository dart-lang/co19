/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Zone fork({ZoneSpecification specification, Map<Symbol,
 *    dynamic> zoneValues})
 * Creates a new zone as a child of this.
 * @description Checks that returned zone is a child of this.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

int count=0;

void test(Zone z) {
  Zone z2 = z.fork();
  Expect.equals(z, z2.parent);

  z2.run(() {
    Expect.equals(z, Zone.current.parent);

    if (++count < 10) {
      test(Zone.current);
    }
  });
}

main() {
  test(Zone.current);
}
