/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEachEntry(void f(DoubleLinkedQueueEntry<E> element))
 * @description Checks [forEachEntry()] on empty list.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  int count = 0;
  queue.forEachEntry((var entry) {
    var element = entry.element;
    count++;
  });
  
  Expect.isTrue(count == 0);
}
