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
 * @description Checks that if element is found, it is passed to the resulting
 * future.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

void check1(Iterable data, bool test(element), var expected) {
  Stream s = new Stream.fromIterable(data);
  asyncStart();
  Future f = s.lastWhere(test);
  f.then((actual) {
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

void check2(Iterable data, bool test(element), var expected) {
  Stream s = new Stream.fromIterable(data);
  asyncStart();
  Future f = s.lastWhere(test, orElse: () {
    Expect.fail("should not be called");
  });
  f.then((actual) {
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

void check(Iterable data, bool test(element), var expected) {
  check1(data, test, expected);
  check2(data, test, expected);
}

main() {
  check([1, 2, 3], (element) => true, 3);
  check([1, 2, 3], (element) => element != null, 3);
  check([1, 2, 3, null], (element) => element == null, null);
  check([1, 2, 3], (element) => element > 0, 3);
  check(new Iterable.generate(10, (int index) => index * 5),
      (element) => element != 30, 45);
  check(new Iterable.generate(10, (int index) => index * 5),
      (element) => element == 30, 30);
}
