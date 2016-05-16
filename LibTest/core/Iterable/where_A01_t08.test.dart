/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate f.
 * @description Checks that nested invocations of where() on the same collection
 * does not cause any errors.
 * @author pagolubev
 */
library where_A01_t08;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Iterable l = create([1, -3, 10, 17]);

  List l1 = new List();
  Iterable outer = l.where((var x) {
    l1.add(x);
    List l2 = new List();
    Iterable inner = l.where((var y) {
      l2.add(y);
      return true;
    });
    Iterator it = inner.iterator;
    while(it.moveNext()) {}
    
    Expect.iterableEquals(l, l2);
    return true;
  });

  Iterator it = outer.iterator;
  while(it.moveNext()) {}
  Expect.iterableEquals(l, l1);
}
