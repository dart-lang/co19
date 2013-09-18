/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DoubleLinkedQueueEntry<E> lastEntry()
 * @description Checks that the method returns the last entry of the queue.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  queue.addFirst(1);
  Expect.isTrue(queue.lastEntry().element == 1);
  
  queue.addLast(2);
  Expect.isTrue(queue.lastEntry().element == 2);
  
  queue.addFirst(null);
  Expect.isTrue(queue.lastEntry().element == 2);
  
  queue.addLast(22);
  Expect.isTrue(queue.lastEntry().element == 22);
}
