/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future firstWhere(bool test(T element), {Object defaultValue()})
 * If no such element is found before this stream is done, and a defaultValue
 * function is provided, the result of calling defaultValue becomes the value of
 * the future.
 * @description Checks that if this stream ends without finding a match and a
 * defaultValue function is provided, the result of calling defaultValue becomes
 * the value of the future.
 * @author kaigorodov
 */
library firstWhere_A02_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";

void check<T>(Stream<T> s, bool test(T element), T expected) {
  AsyncExpect.value(expected, s.firstWhere(test, defaultValue: () => expected));
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
