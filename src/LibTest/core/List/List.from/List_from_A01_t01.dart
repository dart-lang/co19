/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a list with the elements of [other]. The order in
 * the list will be the order provided by the iterator of [other].
 * @description Checks that proper list with correct element order is created.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

void checkEquals(Collection expected, List actual) {
  Expect.equals(expected.length, actual.length);
  Iterator it = expected.iterator();
  var i = 0;
  while (it.hasNext()) {
    Object o = it.next();
    Expect.isTrue(actual[i] === o);
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

  l.addAll(["1","2","3","4","5"]);
  a = new List.from(l);
  checkEquals(l, a);

  List src = [null, [null], [], [1,2,3], [[null]]];
  a = new List.from(src);
  checkEquals(src, a);

  src = new List(34567);
  src[34566] = -111111111;
  a = new List.from(src);
  checkEquals(src, a);
}
