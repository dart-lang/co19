/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * The count must not be negative
 * @description checks that a RangeError is thrown if n is negative.
 * @author kaigorodov
 */
library skip_A03_t01;
import "../../../Utils/expect.dart";

check(Iterable a, int n) {
  Expect.throws(() {a.skip(n);}, (e) => e is RangeError);
}

test(Iterable create([Iterable content])) {
  check(create([1, 2, -3, 4]), -1);
  check(create(const[1, 2, -5, -6, 100]), -1);
  check(create(const[null, 2, -5, -6, 100]), -1000);
}
