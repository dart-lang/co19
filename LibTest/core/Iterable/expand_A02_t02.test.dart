/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that the returned Iterable is lazy. Function f is
 * called each time when the object is iterated
 * @author sgrekhov@unipro.ru
 */
library expand_A02_t02;
import "../../../Utils/expect.dart";

void check(Iterable a) {
  int count = 0;
  Iterable expanded = a.expand((element) {
    count++;
    return [element];
  });
  Expect.equals(0, count);
  expanded.length;
  Expect.equals(a.length, count);
  expanded.length;
  Expect.equals(2 * a.length, count);
}

test(Iterable create([Iterable content])) {
  check(create());
  check(create([1]));
  check(create([1, 2]));
  check(create([1, 2, 2]));
  check(create([1, 2, 2, 3]));
}
