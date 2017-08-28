/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future lastWhere(bool test(T element), {Object defaultValue()})
 * Finds the last element in this stream matching test.
 * As firstWhere, except that the last matching element is found.
 * That means that the result cannot be provided before this stream is done.
 * @description Checks that if an error occurs in the stream, the future will
 * receive that error.
 * @author kaigorodov
 * @author a.semenov@unipro.ru
 */
library lastWhere_A03_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element), Object expectedError) {
  asyncStart();
  s.lastWhere(test).then(
    (data) {
      Expect.fail("Returned future should complete with error");
    },
    onError: (error) {
      Expect.equals(expectedError, error);
      asyncEnd();
    }
  );
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([1,2,3], isError:(e) =>true), (x) => x > 0, 1);
  check(create([1,2,3], isError:(e) => e==3), (x) => x > 0, 3);
  check(create([-1,1,-2,2,3], isError:(e) => e==3), (x) => x < 0, 3);
}
