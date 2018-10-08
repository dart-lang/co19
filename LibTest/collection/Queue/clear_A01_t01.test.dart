/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  void clear()
 * Removes all elements in the queue. The size of the queue becomes zero.
 * @description Check that all elements of the queue removed.
 * @author msyabro
 */
import "../../../Utils/expect.dart";
import "dart:collection";

test(Queue create([Iterable content])) {
  Queue queue = create();
  queue.clear();
  Expect.isTrue(queue.isEmpty);
  
  queue.addFirst(1);
  queue.addFirst(1);
  Expect.isFalse(queue.isEmpty);
  queue.clear();
  Expect.isTrue(queue.isEmpty);

  queue.clear();
  Expect.isTrue(queue.isEmpty);
  for(int i = 0; i < 1000; i++) {
    queue.add(i);
  }
  queue.clear();
  Expect.isTrue(queue.isEmpty);
}
