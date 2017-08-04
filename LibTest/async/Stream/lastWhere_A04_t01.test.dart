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
 * @description Checks that if this stream ends without finding a match and with
 * no defaultValue function provided, the future will receive an error.
 * @author kaigorodov
 */
library lastWhere_A04_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s, bool test(T element)) {
  asyncStart();
  s.lastWhere(test).then(
    (data) {
      Expect.fail("Returned future should complete with error");
    },
    onError: (error) {
      Expect.isTrue(error is Error);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]), (int element) => true);
  check(create([1, 2, 3]), (int element) => element == null);
  check(create([null, null]), (int element) => element != null);
  check(create(new Iterable.generate(0, (int index) => index)), (int element) => false);
  check(create(new Iterable.generate(10, (int index) => index)), (int element) => false);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element < 0);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element == 300);
}
