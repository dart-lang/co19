/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * Returns the first element of the stream.
 * @description Checks that the first element is returned.
 * @author kaigorodov
 */
library first_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s, Object expected) {
  asyncStart();
  s.first.then(
    (value) {
      Expect.equals(expected, value);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([123]), 123);
  check(create([1,2,3]), 1);
}
