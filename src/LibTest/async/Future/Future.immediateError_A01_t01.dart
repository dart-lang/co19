/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.immediateError(error, [Object stackTrace])
 * A future that completes with an error in the next event-loop iteration.
 * @description Checks that a future created with constructor
 * Future.immediate has the error passed as a parameter.
 * @author kaigorodov
 */

import "dart:async";

check(value) {
  Future future = new Future.immediateError(value);
  
  future.catchError((error) {
    Expect.equals(value, error.error);
  });
}

main() {
  check(0);
  check(1);
  check(-5);
  check('');
  check('string');
  check(null);
  check(true);
  check(const []);
  check(const {'k1': 1, 'k2': 2});
}
