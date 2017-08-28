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
 * @description Checks that if [test] throws error, the returned future will
 * receive this error.
 * @author a.semenov@unipro
 */
library lastWhere_A05_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element), Object expected) {
  asyncStart();
  s.lastWhere(test).then(
    (data) {
      Expect.fail("Returned future should complete with error");
    },
    onError: (error) {
      Expect.equals(expected, error);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([1, 2, 3]), (e) => throw "a", "a");
  check(create([1, 2, 3]), (e) { if (e==3) throw "b"; return true; }, "b");
}
