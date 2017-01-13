/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEachEntry(void f(DoubleLinkedQueueEntry<E> element))
 * @description Checks that [forEachEntry()] iterates over each element of the
 * queue.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  for(int i = 0; i < 100; i++) {
    queue.addLast(i);
  }
  
  List a = new List(100);
  
  queue.forEachEntry((var entry) {
    var element = entry.element;
    a[element] = element;
  });
  
  for(int i = 0; i < 100; i++) {
    Expect.isTrue(a[i] == i);
  }
}
