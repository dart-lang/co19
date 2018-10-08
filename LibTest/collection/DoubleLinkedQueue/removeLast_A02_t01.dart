/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The queue must not be empty when this method is called.
 * @description Checks that exception is thrown if the queue is empty.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  Expect.throws(() { queue.removeLast(); }, (e) => e is StateError);
  
  queue.addLast(1);
  queue.addLast(2);
  queue.clear();

  Expect.throws(() { queue.removeLast(); }, (e) => e is StateError);
}
