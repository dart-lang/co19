/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.immediate(T value)
 * A future whose value is available in the next event-loop iteration.
 * @description Checks that a future created with constructor
 * Future.immediate has the value passed as a parameter.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

check(value) {
  Future future = new Future.immediate(value);
  
  future.then((fValue) {
    Expect.equals(fValue, value);
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
