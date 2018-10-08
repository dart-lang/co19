/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isEmpty
 * Whether this stream contains any elements.
 * Waits for the first element of this stream, then completes the returned
 * future with `true`.
 * If the stream ends without emitting any elements, the returned future is
 * completed with `false`.
 * @description Checks that only first element of the stream is examined
 * @author a.semenov@unipro.ru
 */
library isEmpty_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s, bool expected) {
  int count = 0;
  asyncStart();
  s = s.map(
    (e) {
      count++;
      return e;
    }
  );
  s.isEmpty.then(
    (bool actual) {
      Expect.equals(expected ? 0 : 1, count);
      Expect.equals(expected, actual);
      asyncEnd();
    }
  );
}

test(CreateStreamFunction create) {
  check(create([]), true);
  check(create([1, 2, 3, null]), false);
  check(create(new Iterable.generate(0, (int index) => 1)), true);
  check(create(new Iterable.generate(10, (int index) => 1)), false);
}
