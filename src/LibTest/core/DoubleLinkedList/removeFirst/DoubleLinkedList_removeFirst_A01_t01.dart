/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes and returns the first element of the list.
 * @description Check that first element is removed
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  list.addLast(1);
  list.addLast("2");
  list.addLast(true);

  Expect.isTrue(list.length == 3);

  Expect.isTrue(list.removeFirst() == 1);
  Expect.isTrue(list.length == 2);
  Expect.isTrue(list.first() == "2");

  Expect.isTrue(list.removeFirst() == "2");
  Expect.isTrue(list.length == 1);
  Expect.isTrue(list.first() == true);

  Expect.isTrue(list.removeFirst() == true);
  Expect.isTrue(list.length == 0);
}
