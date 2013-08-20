/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Set<E> toSet()
 * Creates a Set containing the elements of this Iterable.
 * @description Checks that proper Set with correct element order is created.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void checkEquals(Iterable expected, Set actual) {
  Set set0=new Set();
  for (var el in expected) {
    set0.add(el);
  }
  Expect.isTrue(set0.containsAll(actual));
  Expect.isTrue(actual.containsAll(set0));
}

main() {
  List l = new List();
  Set a = l.toSet();
  Expect.equals(0, a.length);
  Expect.equals(0, l.length);

  l.addAll([1,"2","3","4","5", "4", 1]);
  a = l.toSet();
  checkEquals(l, a);

  List src = [null, [null], [], [1,2,3], [[null]]];
  a = src.toSet();
  checkEquals(src, a);

  src = new List(34567);
  src[34566] = -111111111;
  a = src.toSet();
  checkEquals(src, a);
}
