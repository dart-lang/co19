/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.delayed(Duration duration, [T computation()])
 * Creates a future that completes after a delay.
 * The future will be completed after the given duration has passed with the result
 * of calling computation.
 * @description Checks that execution of the supplied value() function happens after delay.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

var lastValue=null;

check(delay, value, expectedLastValue) {
  Future future = new Future.delayed(durationMs(delay), ()=>value);
  asyncStart();
  future.then((fValue) {
    Expect.equals(lastValue, expectedLastValue);
    lastValue=fValue;
    asyncEnd();
  });
}

main() {
  check(100, 3, 22);
  check(50, 22, 11);
  check(0, 11, null);
}
