/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> toSet()
 * Creates a Set containing the elements of this Iterable.
 * @description Checks that proper Set is created.
 * @author kaigorodov
 */
library toSet_A01_t01;
import "../../../Utils/expect.dart";

void checkEquals(Iterable expected, Set actual) {
  Set set0 = new Set();
  for (var el in expected) {
    set0.add(el);
  }
  Expect.isTrue(set0.containsAll(actual));
  Expect.isTrue(actual.containsAll(set0));
}

test(Iterable create([Iterable content])) {
  Iterable l = create();
  Set a = l.toSet();
  Expect.equals(0, a.length);
  Expect.equals(0, l.length);

  l = create([1, 2, 3, 4, 5, 4, 1]);
  a = l.toSet();
  checkEquals(l, a);

  Iterable src = create([null, [null], [], [1, 2, 3], [[null]]]);
  a = src.toSet();
  checkEquals(src, a);

  List lst = new List(34);
  lst[32] = -111111111;
  src = create(lst);
  a = src.toSet();
  checkEquals(src, a);
}
