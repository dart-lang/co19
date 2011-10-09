/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates empty list
 * @description Check that empty list is created
 * @author msyabro
 * @needsreview undocumented
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  Expect.isTrue(list.isEmpty());
}
