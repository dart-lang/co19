/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes all elements of the queue.
 * @description Check that all elements of the queue removed.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue list = new Queue();
  list.clear();
  Expect.isTrue(list.isEmpty);
  
  list.addFirst(1);
  list.addFirst(1);
  Expect.isFalse(list.isEmpty);
  list.clear();
  Expect.isTrue(list.isEmpty);
  list.clear();
  Expect.isTrue(list.isEmpty);
  for(int i = 0; i < 1000; i++) {
    list.add(i);
  }
  list.clear();
  Expect.isTrue(list.isEmpty);
}
