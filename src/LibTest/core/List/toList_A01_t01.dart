/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract List<E> toList({bool growable: true})
 * Creates a List containing the elements of this Iterable.
 * The elements will be in iteration order. The list is fixed-length if growable is false.
 * @description Checks that proper list with correct element order is created.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void checkEquals(Collection expected, List actual) {
  Expect.equals(expected.length, actual.length);
  Iterator it = expected.iterator;
  var i = 0;
  while (it.moveNext()) {
    Object o = it.current;
    Expect.identical(actual[i], o);
    Expect.isTrue(actual[i] == o);
    i++;
  }
}

main() {
  List l = new List();
  List a = l.toList();
  Expect.equals(0, a.length);
  Expect.equals(0, l.length);

  l.addAll(["1","2","3","4","5"]);
  a = l.toList();
  checkEquals(l, a);

  List src = [null, [null], [], [1,2,3], [[null]]];
  a = src.toList();
  checkEquals(src, a);

  src = new List(34567);
  src[34566] = -111111111;
  a = src.toList();
  checkEquals(src, a);
}
