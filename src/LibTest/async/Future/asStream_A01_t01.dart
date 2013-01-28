/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Stream<T> asStream()
 * Creates a Stream that sends this' completion value, data or error, to its subscribers.
 * @description Checks that the stream sends this' data to all its subscribers.
 * @author kaigorodov
 */

import "dart:async";

check(var value) {
  Future future = new Future.immediate(value);
  Stream stream=future.asStream();
  Future f2=stream.single;
  Future f3=stream.single;

  f2.then((fValue) {
    Expect.equals(fValue, value);
  });
  f3.then((fValue) {
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
