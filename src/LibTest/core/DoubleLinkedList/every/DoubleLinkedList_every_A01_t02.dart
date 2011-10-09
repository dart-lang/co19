/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisify the
 * predicate [f]. Returns false otherwise.
 * @description Check every() on empty list
 * @author msyabro
 * @needsreview some() on empty lists returns false, but every() returns true
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  int count = 0;
  bool res = list.every(bool f(var element) {
    count++;
    return false;
  });
  
  Expect.isTrue(count == 0);
  Expect.isTrue(res == true);
}
