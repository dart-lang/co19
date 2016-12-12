/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Iterable<E> reversed
 * Returns an Iterable of the elements of this List in reverse order.
 * @description Checks that the returned [Iterator] iterates all elements of the
 * list.
 * @author kaigorodov
 */
library reversed_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void checkReversedIterator(List a) {
    List b = create();
    b.addAll(a);
    Iterator it = b.reversed.iterator;
    int i = a.length-1;
    while (it.moveNext()) {
      Expect.isTrue(it.current == a[i--]);
    }
    Expect.equals(-1, i);
  }
  
  checkReversedIterator([]);
  checkReversedIterator(const [null, 0, "1", false, const []]);
  checkReversedIterator(new List(300));

  List a = new List(365);
  for (var i = 0; i < a.length; i++) {
    a[i] = i;
  }
  checkReversedIterator(a);
  checkReversedIterator(["0", "1", "2", "3", "4", "5"]);
}
