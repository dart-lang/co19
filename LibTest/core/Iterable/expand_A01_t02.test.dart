/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable expand(Iterable f(E element))
 * Expands each element of this Iterable into zero or more elements.
 * The resulting Iterable runs through the elements returned by f for each
 * element of this, in iteration order.
 * The returned Iterable is lazy, and calls f for each element of this every
 * time it's iterated.
 * @description Checks that the length of resulting Iterable equals  the total
 * number of inserted values
 * @author kaigorodov
 */
library expand_A01_t02;
import "../../../Utils/expect.dart";

void check(Iterable a) {
  int count = 0;
  Iterable expanded = a.expand((element) {
    List res = new List();
    for (int k = 0; k < element; k++) {
      res.add(k);
      count++;
    }
    return res;
  });
  int expanded_length = expanded.length; // force lazy evaluation
  Expect.equals(count, expanded_length);
}

test(Iterable create([Iterable content])) {
  check(create());
  check(create([1]));
  check(create([1, 2]));
  check(create([1, 2, 2]));
  check(create([1, 2, 2, 3]));
}
