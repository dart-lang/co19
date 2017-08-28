/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future firstWhere(bool test(T element), {Object defaultValue()})
 * Finds the first element of this stream matching test.
 * Returns a future that is filled with the first element of this stream that
 * test returns true for.
 * @description Checks that if element is found, it is passed to the resulting
 * future. [defaultValue] is provided.
 * @author kaigorodov
 */
library firstWhere_A01_t02;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s, bool test(int element), Object expected) {
  asyncStart();
  bool defaultValueUsed = false;
  Future f = s.firstWhere(test, defaultValue: () {defaultValueUsed = true;});
  f.then(
    (int actual) {
      Expect.equals(expected, actual);
      Expect.isFalse(defaultValueUsed);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([1, 2, 3]), (int element) => true, 1);
  check(create([1, 2, 3]), (int element) => element != null, 1);
  check(create([1, 2, 3, null]), (int element) => element == null, null);
  check(create([1, 2, 3]), (int element) => element > 2, 3);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element !=30, 0);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element == 30, 30);
}
