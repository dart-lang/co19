/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 *    Returns the value of the indexth data event of this stream.
 *    Stops listening to the stream after the indexth data event has been received.
 * @description Checks that the future returns the value of the indexth data
 * event of this stream.
 * @author kaigorodov
 */
library elementAt_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const VALUE = 123;

void check(Stream s, int index, Object expected) {
  asyncStart();
  s.elementAt(index).then(
    (actual) {
      Expect.equals(expected, actual);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([VALUE]), 0, VALUE);
  check(create([1,VALUE,2,3]), 1, VALUE);
  for (int k = 0; k < 10; k++) {
    Stream s = create(new Iterable.generate(10, (int index) => index));
    check(s, k, k);
  }
}
