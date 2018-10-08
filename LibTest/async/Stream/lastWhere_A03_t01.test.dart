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
 * @description Checks that if an error occurs in the stream, the future will
 * receive that error.
 * @author kaigorodov
 * @author a.semenov@unipro.ru
 */
library lastWhere_A03_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element), Object expectedError) {
  AsyncExpect.error(expectedError, s.lastWhere(test));
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([1,2,3], isError:(e) => true), (x) => x > 0, 1);
  check(create([1,2,3], isError:(e) => e == 3), (x) => x > 0, 3);
  check(create([-1,1,-2,2,3], isError:(e) => e == 3), (x) => x < 0, 3);
}
