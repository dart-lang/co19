/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an exception if the list is empty.
 * @description Check that exception is thrown
 * @author msyabro
 * @needsreview what type of exception
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  try {
    list.removeLast();
    Expect.fail("Exception is expected");
  } catch(Object e) {}
  
  list.addLast(1);
  list.addLast(2);
  list.clear();

  try {
    list.removeLast();
    Expect.fail("Exception is expected");
  } catch(Object e) {}
}
