/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void run(void callback())
 * Runs the given callback asynchronously as soon as possible.
 * This function is equivalent to new Timer(Duration.ZERO, callback).
 * @description Checks that callback finction is called once.
 * @author kaigorodov
 */

import "dart:async";

import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(delay) {
}

main() {
  bool seen=false;

  asyncStart();
  Timer.run(() {
    Expect.isFalse(seen);
    seen=true;
    asyncEnd();
  });
}

