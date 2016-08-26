/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E element), {E orElse()})
 * Returns the first element that satisfies the given predicate test.
 * Iterates through elements and returns the first to satsify test.
 * If no element satisfies test, the result of invoking the orElse function
 * is returned. If orElse is omitted, it defaults to throwing a StateError.
 * @description Checks that the first element that satisfies the test
 * is returned.
 * @author kaigorodov
 */
library firstWhere_A01_t01;
import "../../../Utils/expect.dart";

check(Iterable a, bool test(value), var expected) {
  var actual = a.firstWhere(test);
  Expect.equals(expected, actual);
}

test(Iterable create([Iterable content]), {bool isSet: false}) {
  if (isSet) {
    // Set may be unordered so the first element that satisfies the test is
    // unpredictable. Test the case where the only element satisfies
    check(create([1, 2, -3, 4]), (value) => value > 2, 4);
    check(create([1, 2, -7, -5]), (value) => value < -5, -7);
  } else {
    check(create([1, 2, -3, 4]), (value) => value > 1, 2);
    check(create([1, 2, -5, -6]), (value) => value < 0, -5);
  }
}
