/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the [index]th element.
 * @description Checks that the method returns the index'th element of the queue.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  queue.addFirst(1);
  Expect.isTrue(queue.elementAt(0) == 1);
  
  queue.addLast(2);
  Expect.isTrue(queue.elementAt(0) == 1);
  Expect.isTrue(queue.elementAt(1) == 2);
  
  queue.addFirst(null);
  Expect.isTrue(queue.elementAt(0) == null);
  Expect.isTrue(queue.elementAt(1) == 1);
  Expect.isTrue(queue.elementAt(2) == 2);
}
