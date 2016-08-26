/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * ...
 * The matching elements have the same order in the returned iterable as they
 * have in iterator.
 * @description Checks that all elements of the returned have the same order as
 * they have in iterator
 * @author sgrekhov@unipro.ru
 */
library where_A02_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {

  void check(Iterable source, bool f(element), Iterable expected) {
    Iterable ret = create(source).where(f);
    Iterator it = ret.iterator;
    while(it.moveNext()) {
      Expect.isTrue(f(it.current));
    }
    Expect.iterableEquals(create(expected), ret);
  }

  bool f(var e) { return (e >= 0); }
  check([-1, 0, 1, 2, 3, 4], f, [0, 1, 2, 3, 4]);
  check([-1, 0, 1, -2, 3, 4], f, [0, 1, 3, 4]);
  check([1, 0, -1, 2, -3, 4], f, [1, 0, 2, 4]);
}
