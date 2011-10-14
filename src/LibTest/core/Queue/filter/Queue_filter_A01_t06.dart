/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new collection with the elements of this collection
 * that satisfy the predicate [f].
 * @description Tries to change the list from [f]
 * @author msyabro
 * @needsreview Can changes in list affect iteration?
 */


main() {
  Queue list = new Queue();
  
  list.addLast(1);
  list.addLast(1);
  Queue res = list.filter(bool func(var element){
    list.clear();
    return true;
  });
  Expect.isTrue(list.isEmpty());
  Expect.isTrue(res.length == 2);//????
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  list.filter(bool func(var element) {
    list.removeFirst();//NullPointerException. Does filter iterate over a copy of the list?
    return true;
  });
  Expect.isTrue(list.isEmpty());
  
  
}
