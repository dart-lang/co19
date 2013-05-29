/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Iterable<E> reversed
 * Returns an Iterable of the elements of this List in reverse order.
 * @description Checks that the returned [Iterator] iterates all elements of the list.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void checkReversedIterator(List a) {
  Iterator it = a.reversed.iterator;
  int i = a.length-1;
  while (it.moveNext()) {
    Expect.isTrue(it.current == a[i--]);
  }
  Expect.equals(-1, i);
}

main() {
  checkReversedIterator([]);
  checkReversedIterator(const [null,0,"1", false, const []]);
  checkReversedIterator(new List(300));

  List a = new List(365);
  for (var i=0; i < a.length; i++) {
    a[i] = i;
  }
  checkReversedIterator(a);

  List l = new List();
  l.addAll(["0","1","2","3","4","5"]);
  a = new List.from(l);
  checkReversedIterator(a);
}
