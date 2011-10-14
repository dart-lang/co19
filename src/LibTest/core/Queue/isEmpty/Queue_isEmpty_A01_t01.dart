/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if there is no element in the collection.
 * @description Checks that method works correctly.
 * @author msyabro
 */


main() {
  Queue list = new Queue();
  
  Expect.isTrue(list.isEmpty());
  
  list.addLast(1);
  Expect.isTrue(!list.isEmpty());
  
  list.addFirst(1);
  Expect.isTrue(!list.isEmpty());
  
  list.removeFirst();
  list.removeFirst();
  Expect.isTrue(list.isEmpty());
}
