/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable map(f(E element))
 * Returns a new lazy Iterable with elements that are created by calling f on
 * each element of this Iterable in iteration order.
 * @description Checks that the resulting [Iterable] contains all the results of
 * [f(e)].
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

f(var element) {
  return [element];
}
    
void checkResult(DoubleLinkedQueue queue) {
  int count = 0;
  Iterable mapIter = queue.map(f);
  for (var el in mapIter) {
    Expect.listEquals(f(queue.elementAt(count)), el);
    count++;
  }
  Expect.equals(queue.length, count);
}

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  checkResult(queue);
  queue.add(22);
  checkResult(queue);
  queue.add(11);
  checkResult(queue);
  queue.add(11);
  checkResult(queue);
  for (int k = -100; k < 200; k++) {
    queue.add(k);
  }
  checkResult(queue);
}
