/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate f.
 * @description Checks that all elements of the returned Iterable satisfy the
 * predicate [f].
 * @author vasya
 */
library where_A01_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {

  void check(Iterable source, bool f(element), Iterable expected) {
    Iterable ret = create(source).where(f);
    Iterator it = ret.iterator;
    while(it.moveNext()) {
      Expect.isTrue(f(it.current));
    }
    Expect.iterableEquals(expected, ret);
  }

  bool f(var e) { return (e > 1); }
  check([-1, 0, 1, 2, 3, 4], f, [2, 3, 4]);

  bool f2(var e) { return (e == -123); }
  List l = new List(100);
  for (int i = 0; i < l.length; i++) {
    l[i] = 0;
  }
  l[99] = -123;
  check(l, f2, [-123]);
  
  bool f3(var e) { return (e < 0); }
  check([1, 2, 3], f3, []);
}
