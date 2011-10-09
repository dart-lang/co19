/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes all elements of the collection.
 * @description Check that method works correctly
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  list.clear();
  Expect.isTrue(list.isEmpty());
  
  list.addFirst(1);
  list.addFirst(1);
  list.clear();
  Expect.isTrue(list.isEmpty());
}
