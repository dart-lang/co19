/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an EmptyQueueException exception if this queue is empty.
 * @description Checks that exception is thrown if the list is empty.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue list = new Queue();
  try {
    list.removeLast();
    Expect.fail("Exception is expected");
  } catch(EmptyQueueException e) {}
  
  list.addLast(1);
  list.addLast(2);
  list.clear();

  try {
    list.removeLast();
    Expect.fail("Exception is expected");
  } catch(EmptyQueueException e) {}
}
