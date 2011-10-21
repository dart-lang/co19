/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new collection with the elements of this collection
 * that satisfy the predicate [f].
 * @description Checks filter() on empty list
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue list = new Queue();
  
  int count = 0;
  Queue res = list.filter(bool f(var element) {
    count++;
    return true;
  });
  
  Expect.isTrue(count == 0);
  Expect.isTrue(res.isEmpty());
}
