/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void scheduleMicrotask(void f())
 * Runs f asynchronously.
 * @description Checks that f is run in this zone.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

test(Zone z) {
  asyncStart();
  z.scheduleMicrotask(() {
    Expect.equals(z, Zone.current);
    asyncEnd();
  });
}

main() {
  test(Zone.current);
  test(Zone.current.fork());
}
