/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory List.from(Iterable other, {bool growable: true})
 * Creates an list with the elements of other.
 * The order in the list will be the order provided by the iterator of other.
 * The returned list is growable if growable is true, otherwise it's a fixed
 * length list.
 * @description Checks that proper list with correct element order is created.
 * @author vasya
 */
import "../../../Utils/expect.dart";

void checkEquals(Iterable expected, List actual) {
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
  Set<int> s = new Set<int>();
  List a = new List.from(s);
  Expect.equals(0, a.length);
  Expect.equals(0, s.length);

  for (var i = 0; i < 10; i++){
    s.add(i);
  }
  a = new List.from(s);
  checkEquals(s, a);

  List l = new List();
  a = new List.from(l);
  Expect.equals(0, a.length);
  Expect.equals(0, l.length);

  l.addAll(["1", "2", "3", "4", "5"]);
  a = new List.from(l);
  checkEquals(l, a);

  List src = [null, [null], [], [1, 2, 3], [[null]]];
  a = new List.from(src);
  checkEquals(src, a);

  src = new List(34567);
  src[34566] = -111111111;
  a = new List.from(src);
  checkEquals(src, a);
}
