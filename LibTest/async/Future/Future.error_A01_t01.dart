/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.error(error, [Object stackTrace])
 * A future that completes with an error in the next event-loop iteration.
 * The error must not be null.
 *
 * @description Checks that a future created with constructor
 * Future.error has the error passed as a parameter.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(value) {
  asyncStart();
  new Future.error(value)
    .catchError((error) {
      if (value == null) {
        Expect.isTrue(error is NullThrownError);
      } else {
        Expect.identical(value, error);
      }
      asyncEnd();
    });
}

main() {
  check(0);
  check(1);
  check(-5);
  check('');
  check('string');
  check(true);
  check(const []);
  check(const {'k1': 1, 'k2': 2});
}
