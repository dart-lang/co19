/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> singleWhere(bool test(T element))
 * Finds the single element in this stream matching test.
 * Like lastMatch, except that it is an error if more than one matching element
 * occurs in the stream.
 * @description Checks that the single element is returned.
 * @author kaigorodov
 */
library singleWhere_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element), T expected) {
  AsyncExpect.value(expected, s.singleWhere(test));
}

void test(CreateStreamFunction create) {
  check(create([1, 2, 3, null]), (int element) => element == null, null);
  check(create([1, 2, 3]), (int element) => element > 2, 3);
  check(
      create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element == 30,
      30
  );
}
