/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> length
 *    The number of elements in this stream.
 *    Waits for all elements of this stream. When the stream ends, the returned
 * future is completed with the number of elements.
 * @description Checks that correct number of elements is returned.
 * @author kaigorodov
 */
library length_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s, int expected) {
  asyncStart();
  s.length.then((value) {
    Expect.equals(expected, value);
    asyncEnd();
  });
}

void test(CreateStreamFunction create) {
  check(create([]), 0);
  check(create([1, 2, 3, null]), 4);
  check(create(new Iterable.generate(0, (int index) => index * 2)), 0);
  check(create(new Iterable.generate(10, (int index) => index * 2)), 10);
}
