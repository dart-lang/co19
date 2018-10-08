/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion previousEntry() → DoubleLinkedQueueEntry<E>
 * Returns the previous entry or [null] if there is none.
 * @description Checks that nextEntry() returns the next element
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  queue.add(1);
  queue.add(2);
  queue.add(3);

  Expect.equals(2, queue.lastEntry().previousEntry().element);
  Expect.equals(1, queue.lastEntry().previousEntry().previousEntry().element);
  Expect.isNull(queue.firstEntry().previousEntry());
}
