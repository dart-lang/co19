/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate f.
 * @description Checks that the predicate method is called for all elements of
 * the list as long as the resulting iterable is iterated over to the end.
 * @author sgrekhov@unipro.ru
 */
library where_A01_t02;
 
import "../../../Utils/expect.dart";

check(Iterable a, bool f(var e)) {
  List copy = new List();
  bool tst(var e) {
    copy.add(e);
    return f(e);
  }

  Iterable ret = a.where(tst);
  Iterator it = ret.iterator;
  while(it.moveNext()) {}

  int count = 0;
  Iterator ait = a.iterator;
  while(ait.moveNext()) {
    Expect.equals(ait.current, copy.elementAt(count++));
  }
}

test(Iterable create([Iterable content])) {
  check(create([1, 2, 3, 4, 5, 4, 3, 2, 1]), (e) => e > 1);
  check(create([1, 2, 3, 4, 5, 4, 3, 2, 1]), (e) => e > 2);
  check(create([1, 2, 3, 4, 5, 4, 3, 2, 1]), (e) => e < 0);
}
