/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns null if there is no previous entry.
 * @description Check that null is returned
 * @author msyabro
 * @needsreview undocumented
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  list.addLast(1);
  DoubleLinkedListEntry e = list.lastEntry();
  
  e = e.previousEntry();
  Expect.isTrue(e == null);
}
