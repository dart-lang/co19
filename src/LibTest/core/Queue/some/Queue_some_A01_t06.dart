/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if one element of the collection satisfies the
 * predicate [f]. Returns false otherwise.
 * @description Tries to change the list from [f].
 * @author msyabro
 */


main() {
  Queue list = new Queue();
  
  list.addLast(1);
  list.addLast(1);
  list.some(bool func(var element){ 
    list.clear();
    return false;
  });
  Expect.isTrue(list.isEmpty());
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  list.some(bool func(var element) {
    list.removeFirst();
    return false;
  });
  Expect.isTrue(list.isEmpty());
}
