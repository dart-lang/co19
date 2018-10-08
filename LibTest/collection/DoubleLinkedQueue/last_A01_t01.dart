/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E last
 * Returns the last element.
 * @description Checks that method returns the last element.
 * @author kaigorodov
*/
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  queue.addFirst(1);
  Expect.isTrue(queue.last == 1);
  
  queue.addFirst(2);
  Expect.isTrue(queue.last == 1);
  
  queue.addLast(null);
  Expect.isTrue(queue.last == null);
}
