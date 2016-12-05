/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable expand(Iterable f(E element))
 * Expands each element of this [Iterable] into zero or more elements.
 * The resulting [Iterable] runs through the elements returned by [f] for each
 * element of this, in order.
 * @description Checks that the resulting Iterable runs through the elements
 * returned by f for each element of this, in order.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

Iterable f(int element) {
   List<int> res = new List<int>(element);
   for (int k = 0; k < element; k++) {
     res[k] = element;
   }
   return res;   
}

main() {
  DoubleLinkedQueue<int> queue = new DoubleLinkedQueue<int>();
  
  for (int k = 0; k < 10; k++) {
    queue.add(k);
  }

  Iterator expanded = queue.expand(f).iterator;
  int expected = 1;
  while (expanded.moveNext()) {
    Expect.equals(expected, expanded.current);
    for (int k = 1; k < expected; k++) {
      Expect.isTrue(expanded.moveNext());
      Expect.equals(expected, expanded.current);
    }
    expected++;
  }
  
}
