/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isCompleted
 * Whether the future has been completed.
 * @description Checks that after [complete] is called, isCompleted equals true.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

check(value) {
  var completer = new Completer();
  var future = completer.future;
  Expect.isFalse(completer.isCompleted);
  completer.complete(value);
  Expect.isTrue(completer.isCompleted);
}

main() {
  check(0);
  check(-5);
  check(null);
  check('string');
  check(true);
  check(const {'k1': 1, 'k2': 2});
}
