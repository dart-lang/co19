/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable map(dynamic f(E e))
 * The transformed elements will not be cached. Iterating multiple times over
 * the returned Iterable will invoke the supplied function f multiple times on
 * the same element.
 * @description Checks that iterating multiple times over the the returned
 * Iterable will invoke the supplied function f multiple times on the same
 * element.
 * @author kaigorodov
 */
library map_A03_t01;
import "../../../Utils/expect.dart";

List<int> visited = new List<int>(200);

f(var element) {
  int index;
  if (element is double) {
    index = element.floor();
  } else {
    index = element;
  }
  visited[index]++;
  return element;
}
  
void checkResult(Iterable a, int expected) {
  int count = 0;
  Iterable mapIter = a.map(f);
  for (var el in mapIter) {
    count++;
  }
  Expect.equals(a.length, count);

  for (int k = 0; k < 200; k++) {
    Expect.equals(expected, visited[k]);
  }
}

test(Iterable create([Iterable content])) {
  List l = new List();
  for (int k = 0; k < 200; k++) {
    l.add(k);
    visited[k] = 0;
  }
  Iterable a = create(l);
  checkResult(a, 1);
  checkResult(a, 2);
  checkResult(a, 3);
}
