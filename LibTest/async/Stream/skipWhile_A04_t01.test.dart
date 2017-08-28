/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skipWhile(bool test(T element))
 *    Skip data events from this stream while they are matched by [test].
 *    ...
 *    The test fails when called with a data event
 * if it returns a non-`true` value or if the call to `test` throws.
 * If the call throws, the error is emitted as an error event
 * on the returned stream instead of the data event,
 * otherwise the event that made `test` return non-true is emitted as the
 * first data event.
 * @description Checks that if [test] throws an error, then the error is
 * emitted as an error event on the returned stream and it is considered as
 * [test] failure.
 * @author a.semenov@unipro.ru
 */
library skipWhile_A04_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element),
           Object expectedError, List<T> expected) {
  Object actualError = null;
  List actual = [];
  asyncStart();
  s.skipWhile(test).listen(
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

void test(CreateStreamFunction create) {
  check(create([]), (e) => throw "a", null, []);
  check(create([1, 2, 3]), (e) => throw "b", "b", [2, 3]);
  check(
      create([-1, -2, -3, 1, 2, 3]),
      (element) {
        if (element > 0) {
          throw "c";
        };
        return true;
      },
      "c",
      [2 ,3]
  );
}
