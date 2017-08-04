/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * Checks whether test accepts all elements provided by this stream.
 * Completes the Future when the answer is known.
 * @description Checks that correct answer is passed to the future.
 * @author kaigorodov
 */
library every_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<int> s, bool test(int element), bool expected) {
  asyncStart();
  s.every(test).then(
    (bool actual) {
      Expect.equals(expected, actual);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]), (int element) => true, true);
  check(create([1, 2, 3]), (int element) => element != null, true);
  check(create([1, 2, 3, null]), (int element) => element == null, false);
  check(create(new Iterable.generate(0, (int index) => index)),
      (int element) => false, true);
  check(create(new Iterable.generate(10, (int index) => index)),
      (int element) => false, false);
  check(create(new Iterable.generate(0, (int index) => index)),
      (int element) => true, true);
  check(create(new Iterable.generate(2, (int index) => index)),
      (int element) => true, true);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element == 30, false);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element != 30, false);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element >= 0, true);
}
