/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> last
 * Returns the last element of the stream.
 * @description Checks that the last element is returned.
 * @author kaigorodov
 */
library last_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s, Object expectedValue) {
  asyncStart();
  s.last.then((value) {
    Expect.equals(expectedValue, value);
    asyncEnd();
  });
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([123]), 123);
  check(create([123/2, 123]), 123);
  check(create(new Iterable.generate(10, (int index) => index)), 9);
}
