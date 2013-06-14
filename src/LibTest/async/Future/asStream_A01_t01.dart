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
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(var value) {
  Future future = new Future(()=>value);
  Stream stream=future.asStream();
  Future f2=stream.single;

  asyncStart();
  f2.then((fValue) {
    Expect.equals(fValue, value);
    asyncEnd();
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
