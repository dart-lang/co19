/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> lastWhere (bool test(T element),
 *     {@deprecated dynamic defaultValue(),  T orElse()})
 *
 * Finds the last element in this stream matching test.
 *
 * If this stream emits an error, the returned future is completed with that
 * error, and processing stops.
 *
 * Otherwise as firstWhere, except that the last matching element is found
 * instead of the first. That means that a non-error result cannot be provided
 * before this stream is done.
 *
 * The defaultValue parameter is deprecated, and orElse should be used instead.
 * @description Checks that if this stream ends without finding a match and a
 * defaultValue function is provided, the result of calling [orElse] becomes
 * the value of the future.
 * @author kaigorodov
 */
library lastWhere_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element), Object expected) {
  AsyncExpect.value(expected, s.lastWhere(test, orElse: () => expected));
}

void test(CreateStreamFunction create) {
  check(create([]), (element) => true, 1);
  check(create([1, 2, 3]), (int element) => element == null, null);
  check(create(new Iterable.generate(0, (int index) => index)),
      (int element) => false, 0);
  check(create(new Iterable.generate(0, (int index) => index)),
      (int element) => true, 0);
  check(create(new Iterable.generate(10, (int index) => index)),
      (int element) => false, 22);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element < 0, 33);
}
