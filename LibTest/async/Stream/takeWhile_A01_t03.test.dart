/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> takeWhile(bool test(T element))
 * Forwards data events while test is successful.
 * The returned stream provides the same events as this stream as long as test
 * returns true for the event data.
 * The stream is done when either this stream is done, or when this stream first
 * provides a value that test doesn't accept.
 * @description Checks that if [test] throws an error, then the error is
 * emitted as an error event on the returned stream and it is considered as
 * [test] failure.
 * @author a.semenov@unipro.ru
 */
library takeWhile_A01_t03;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s, bool test(T element),
           Object expectedError, List<T> expected) {
  Object actualError = null;
  List actual = [];
  asyncStart();
  s.takeWhile(test).listen(
    (value) {
      actual.add(value);
    },
    onError: (error) {
      actualError = error;
    },
    onDone: () {
      Expect.equals(expectedError, actualError);
      Expect.listEquals(expected, actual);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]), (e) => throw "a", null, []);
  check(create([1, 2, 3]), (e) => throw "b", "b", []);
  check(
      create([-1, -2, -3, 1, 2, 3]),
      (element) {
        if (element > 0) {
          throw "c";
        };
        return true;
      },
      "c",
      [-1, -2, -3]
  );
}
