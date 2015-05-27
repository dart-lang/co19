/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DoubleLinkedQueueEntry<E> lastEntry()
 * @description Checks that null is returned if this queue is empty.
 * @note undocumented
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  Expect.isNull(queue.lastEntry());
  
  queue.addFirst(1);
  queue.addFirst(2);
  queue.clear();
  
  Expect.isNull(queue.lastEntry());
}
