/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the first element of the queue.
 * @description Checks that the method returns the first 
 * element of the queue.
 * @author msyabro
 * @reviewer varlax
 */
import "dart:collection";

main() {
  Queue queue = new Queue();
  
  queue.addFirst(1);
  Expect.isTrue(queue.first == 1);
  
  queue.addLast(2);
  Expect.isTrue(queue.first == 1);
  
  queue.addFirst(null);
  Expect.isTrue(queue.first == null);
}
