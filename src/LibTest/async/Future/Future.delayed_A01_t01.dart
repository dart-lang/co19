/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.delayed(int milliseconds, T value())
 * Creates a future that completes after a delay.
 * The future will be completed after milliseconds have passed with the result of calling value.
 * If milliseconds is 0, it completes at the earliest in the next event-loop iteration.
 * @description Checks that a future created with the Future.delayed()
 * has the result returned by the supplied value() function.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

check(delay, value) {
  Future future = new Future.delayed(delay, ()=>value);
  
  future.then((fValue) {
    Expect.equals(fValue, value);
  });
}

main() {
  check(0, 0);
  check(10, 1);
  check(0, -5);
  check(10, '');
  check(0, 'string');
  check(10, null);
  check(0, true);
  check(10, const []);
  check(0, const {'k1': 1, 'k2': 2});
}
