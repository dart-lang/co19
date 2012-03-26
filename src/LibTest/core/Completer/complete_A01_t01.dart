/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void complete(value)
 * Supply a value for future.
 * @description Checks that after [complete] is called, a value in corresponding
 * future is available.
 * @author msyabro
 * @reviewer kaigorodov
 */

check(value) {
  var completer = new Completer();
  var future = completer.future;

  completer.complete(value);
  Expect.isTrue(future.hasValue);
  Expect.isTrue(future.isComplete);
  Expect.isNull(future.exception);
  Expect.equals(value, future.value);
}

main() {
  check(0);
  check(-5);
  check(null);
  check('string');
  check(true);
  check(const {'k1': 1, 'k2': 2});
}