/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E single
 * Returns the single element in this.
 * @description Checks that the method returns the single element of the queue.
 * Checks that if this is empty or has more than one element throws a StateError.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
      
  Expect.throws(() { queue.single; }, (e) => e is StateError);
  
  queue.addFirst(1);
  Expect.isTrue(queue.first == 1);
  
  queue.addLast(2);
  Expect.throws(() { queue.single; }, (e) => e is StateError);
}
