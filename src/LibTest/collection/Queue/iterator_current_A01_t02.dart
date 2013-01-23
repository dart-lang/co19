/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Gets the current element in the iteration.
 * @description Checks that the current element in the iteration is taken when the list is changed.
 * @author msyabro
 * @reviewer varlax
 * @needsreview implementation specific
 */
import "dart:collection";

main() {
  Queue list = new Queue.from([0,1,2,3,4,5]);
  Iterator it = list.iterator;
  list.removeFirst();
  list.removeFirst();
  list.removeFirst();
  it.moveNext();
  Expect.equals(3, it.current);
  
  list.removeLast();
  it.moveNext();
  Expect.equals(4, it.current);
}
