/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the last element of the queue.
 * @description Check that method returns the last element.
 * element of the queue
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue queue = new Queue();
  
  queue.addFirst(1);
  Expect.isTrue(queue.last == 1);
  
  queue.addFirst(2);
  Expect.isTrue(queue.last == 1);
  
  queue.addLast(null);
  Expect.isTrue(queue.last == null);
}
