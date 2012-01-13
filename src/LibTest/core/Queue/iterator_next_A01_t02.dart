/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Gets the next element in the iteration.
 * @description Checksthat next element in the iteration is taken when the list is changed.
 * @author msyabro
 * @reviewer varlax
 * @needsreview implementation specific
 */


main() {
  Queue list = new Queue.from([0,1,2,3,4,5]);
  Iterator it = list.iterator();
  list.removeFirst();
  list.removeFirst();
  list.removeFirst();
  Expect.equals(3, it.next());
  
  list.removeLast();
  Expect.equals(4, it.next());
}
