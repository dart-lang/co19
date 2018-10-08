/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionfactory List.generate(int length, E generator(int index),
 * {bool growable: true})
 * Generate a List of values.
 * Creates a list with length positions and fills them by values created by
 * calling generator for each index in the range 0 .. [length]-1 in increasing
 * order.
 * The created length's length is fixed unless growable is true.
 * @description Checks that proper list with correct element order is created.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

typedef Generator(int index);

Generator gengen(List source) {
  return (int index) {
     return source[index];
   };
}

void checkEquals(List expected, List actual) {
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
  List<int> s = new List<int>();
  List a = new List.generate(0, gengen(s));
  Expect.equals(0, a.length);
  Expect.equals(0, s.length);

  for (var i = 0; i < 10; i++){
    s.add(i);
  }
  a = new List.generate(s.length, gengen(s));
  checkEquals(s, a);

  List l = new List();
  a = new List.generate(0, gengen(l));
  Expect.equals(0, a.length);
  Expect.equals(0, l.length);

  l.addAll(["1", "2", "3", "4", "5"]);
  a = new List.generate(l.length, gengen(l));
  checkEquals(l, a);

  List src = [null, [null], [], [1, 2, 3], [[null]]];
  a = new List.generate(src.length, gengen(src));
  checkEquals(src, a);

  src = new List(34567);
  src[34566] = -111111111;
  a = new List.generate(src.length, gengen(src));
  checkEquals(src, a);
}
