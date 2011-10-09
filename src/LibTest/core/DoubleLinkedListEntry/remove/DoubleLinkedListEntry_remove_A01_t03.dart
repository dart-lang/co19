/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes the entry from its list.
 * @description Check that the list can't be iterated
 * with removed entry
 * @author msyabro
 * @needsreview undocumented.
 * Why NullPointerException? Removed entry is not null
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  list.addLast(1);
  list.addLast(2);
  list.addLast(3);
  
  DoubleLinkedListEntry e = list.firstEntry();
  e = e.nextEntry();
  e.remove();
  
  try {
    e.nextEntry();
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    e.previousEntry();
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    e.append(5);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    e.prepend(5);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
