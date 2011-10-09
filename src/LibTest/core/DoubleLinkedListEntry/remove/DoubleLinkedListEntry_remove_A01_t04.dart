/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes the entry from its list.
 * @description Check removal of one of two entries 
 * referred to one place in the list
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  list.addLast(1);
  list.addLast(2);
  list.addLast(3);
  
  DoubleLinkedListEntry e1 = list.firstEntry();
  DoubleLinkedListEntry e2 = list.firstEntry();
  e1 = e1.nextEntry();
  e2 = e2.nextEntry();
  e2.remove();
  
  try {
    e1.nextEntry();
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    e1.previousEntry();
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    e1.append(5);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    e1.prepend(5);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
