/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Timer(Duration duration, void callback())
 * Creates a new timer.
 * The callback callback is invoked after the given duration.
 * @description Checks that callback finction is called after the given duration.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(delay, value) {
  var res;

  asyncStart();
  new Timer(durationMs(delay+5), () {
    Expect.equals(res, value);
    asyncEnd();
  });

  asyncStart();
  new Timer(durationMs(delay), () {
    res=value;
    asyncEnd();
  });
}

main() {
  check(25, const []);
  check(10, null);
  check(2, '');
  check(1, 1);
  check(0, 0);
  check(0, -5);
  check(0, 'string');
  check(0, true);
}

