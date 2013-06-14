/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.delayed(Duration duration, [T computation()])
 * If calling computation throws, the created future will complete with the error.
 * @description Checks that if calling value throws,
 * the created future will complete with the error.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(delay, value) {
  Future future = new Future.delayed(durationMs(delay), (){ throw value;});
  asyncStart();
  future.then((fValue) {Expect.fail("should not get here");},
    onError: (Object err) {
      Expect.equals(value, err);
    asyncEnd();
  });
}

main() {
  check(100, 3);
  check(50, '');
  check(0, []);
}
