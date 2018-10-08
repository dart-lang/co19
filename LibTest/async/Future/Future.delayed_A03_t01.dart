/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.delayed(Duration duration, [dynamic computation()])
 *    If calling computation throws, the created future will complete with the
 * error.
 * @description Checks that if calling computation() throws,
 * the created future will complete with the error.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(delay, value) {
  asyncStart();
  new Future.delayed(durationMs(delay), () {throw value;})
    .then(
      (v) {
        Expect.fail("Created future should complete with error");
      },
      onError: (error) {
        Expect.equals(value, error);
        asyncEnd();
      }
    );
}

main() {
  check(100, 3);
  check(50, '');
  check(0, []);
}
