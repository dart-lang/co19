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
 * @description Checks that the returned Iterable is lazy. Function f is not
 * called if returned Iterable has no elements
 * @author kaigorodov
 * @author sgrekhov@unipro.ru
 */
library expand_A02_t01;

void check(Iterable a) {
  a.expand((var element) {
    throw new Exception("Should not be called");
  });
}

test(Iterable create([Iterable content])) {
  check(create());
  check(create([1]));
  check(create([1, 2]));
  check(create([1, 2, 2]));
  check(create([1, 2, 2, 3]));
}
