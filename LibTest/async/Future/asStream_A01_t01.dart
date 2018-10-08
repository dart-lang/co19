/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asStream()
 * Creates a Stream containing the result of this future.
 * The stream will produce single data or error event containing the completion
 * result of this future, ...
 * @description Checks that the stream sends this' data to all its subscribers.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

check(var value) {
  Future future = new Future(() => value);
  Stream stream = future.asStream();
  Future f2 = stream.single;

  asyncStart();
  f2.then((fValue) {
    Expect.identical(value, fValue);
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
