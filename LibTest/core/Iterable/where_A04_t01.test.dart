/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * ...
 * Iterating will not cache results, and thus iterating multiple times over the
 * returned Iterable will invoke the supplied function test multiple times on
 * the same element.
 * @author sgrekhov@unipro.ru
 */
library where_A04_t01;

import "../../../Utils/expect.dart"	;

void check(Iterable a0, bool test0(var element)) {
  List copy = new List();
  bool tst(var el) {
    copy.add(el);
    return test0(el);
  }

  Iterable itbl = a0.where(tst);
  for (int k = 0; k < 5; k++) {
    Expect.equals(0, copy.length);
    Iterator it = itbl.iterator;
    while (it.moveNext()) {
    }
    Expect.iterableEquals(a0, copy);
    copy = [];
  }
}

test(Iterable create([Iterable content])) {
  Iterable a0 = create([1, 3, 7, 4, 5, 6]);
  check(a0, (var element) => element == 1);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}
