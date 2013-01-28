/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.delayed(int milliseconds, T value())
 * If calling value throws, the created future will complete with the error.
 * @description Checks that if calling value throws,
 * the created future will complete with the error.
 * @author kaigorodov
 */

import "dart:async";

check(delay, value) {
  Future future = new Future.delayed(delay, (){ throw value;});
  future.then((fValue) {Expect.fail("should not get here");},
    onError: (AsyncError err) {
      Expect.equals(err.error, value);
  });
}

main() {
  check(100, 3);
  check(50, '');
  check(0, []);
}
