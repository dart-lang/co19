/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void run(void callback())
 * Runs the given callback asynchronously as soon as possible.
 * This function is equivalent to new Timer(Duration.ZERO, callback).
 * @description Checks that callback finction is called before delayed one.
 * @author kaigorodov
 */

import "dart:async";

import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(delay, value) {
  var res;

  asyncStart();
  new Future.delayed(durationMs(delay), () {
    Expect.equals(res, value);
    asyncEnd();
  });

  asyncStart();
  Timer.run(() {
    res=value;
    asyncEnd();
  });
}

main() {
  check(25, const []);
  check(10, null);
  check(2, '');
  check(1, 1);
}

