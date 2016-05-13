/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * If this has fewer than count elements, then the resulting Iterable is empty.
 * @description if this has fewer than n elements, then the resulting Iterable
 * is empty.
 * @author kaigorodov
 */
library skip_A02_t01;
import "../../../Utils/expect.dart";

check(Iterable a, int n) {
  Iterable it = a.skip(n);
  Expect.equals(0, it.length);
}

test(Iterable create([Iterable content])) {
  check(create([]), 1);
  check(create([1, 2, -3, 4]), 5);
  check(create([11, 2, -3, 4]), 200);
  check(create([1, 22, -3, 4]), 400000);
  check(create(const[1, 2, -5, -6, 100]), 5);
  check(create(const[1, -1, 2, -5, -6]), 5);
  check(create(const[0, 0, 1, 2, -5, -6]), 25);
  check(create(const[0, 0, 1, 2, -5, -6]), 60000);
}
