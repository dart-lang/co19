/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void scheduleMicrotask(void f())
 * Runs f asynchronously.
 * @description Checks that f is run asynchronously.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var x;

  Zone.current.scheduleMicrotask(() {
    x = 1;
    asyncEnd();
  });

  Expect.isNull(x);

  asyncStart();
}
