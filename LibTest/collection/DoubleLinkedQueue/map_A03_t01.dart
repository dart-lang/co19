/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable map(f(E element))
 * The transformed elements will not be cached. Iterating multiple times over
 * the returned [Iterable] will invoke the supplied function [f] multiple times
 * on the same element.
 * @description Checks that iterating multiple times over the the returned
 * [Iterable] will invoke the supplied function [f] multiple times on the same
 * element.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

List<int> visited=new List<int>(200);

int f(int element) {
  visited[element]++;
  return element;
}
  
void checkResult(DoubleLinkedQueue<int> queue, int expected) {
  int count = 0;
  Iterable<int> mapIter = queue.map(f);
  for (int el in mapIter) {
    count++;
  }
  Expect.equals(queue.length, count);
  for (int k = 0; k < 200; k++) {
    Expect.equals(expected, visited[k]);
  }
}

main() {
  DoubleLinkedQueue<int> queue = new DoubleLinkedQueue<int>();
  for (int k = 0; k < 200; k++) {
    queue.add(k);
    visited[k] = 0;
  }
  checkResult(queue, 1);
  checkResult(queue, 2);
  checkResult(queue, 3);
}
