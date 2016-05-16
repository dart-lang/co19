/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * Returns a lazy iterable of the count first elements of this iterable.
 * @description Checks that an Iterable that contains the first n elements is
 * returned.
 * @author kaigorodov
 */
library take_A01_t01;
import "dart:math" as Math;
import "../../../Utils/expect.dart";

check(Iterable a, int n) {
  Iterable it = a.take(n);
  Expect.equals(Math.min(a.length, n), it.length);
  int k = 0;
  for (var el in it) {
    Expect.equals(a.elementAt(k++), el);
  }      
}

test(Iterable create([Iterable content])) {
  check(create([1, 2, -3, 4]), 4);
  check(create([1, 2, -3, 4]), 0);
  check(create([11, 2, -3, 4]), 2);
  check(create([1, 22, -3, 4]), 4);
  check(create(const[1, 2, -5, -6, 100]), 0);
  check(create(const[1, -1, 2, -5, -6]), 1);
  check(create(const[0, 0, 1, 2, -5, -6]), 2);
  check(create(const[0, 0, 1, 2, -5, -6]), 6);
}
