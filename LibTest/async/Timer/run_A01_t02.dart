/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void run(void callback())
 * Runs the given callback asynchronously as soon as possible.
 * This function is equivalent to new Timer(Duration.zero, callback).
 * @description Checks that callback function is called asynchronously.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

check(value) {
  var res = value;

  asyncStart();
  Timer.run(() {
    res = null;
    asyncEnd();
  });

  Expect.equals(res, value);
}

main() {
  check(0);
  check(-5);
  check('string');
  check(true);
}
