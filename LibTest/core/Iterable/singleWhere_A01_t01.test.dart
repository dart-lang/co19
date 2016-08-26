/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * Returns the single element that satisfies f.
 * @description Checks that the single element that satisfies the given
 * predicate f is returned.
 * @author kaigorodov
 */
library singleWhere_A01_t01;
import "../../../Utils/expect.dart";

check(Iterable a, bool f(value), int expected) {
  var actual = a.singleWhere(f);
  Expect.equals(expected, actual);
}

test(Iterable create([Iterable content])) {
  check(create([1, 2, -3, 0]), (value) => value > 1, 2);
  check(create(const[1, 2, -5, -6]), (value) => value == 1, 1);
}
