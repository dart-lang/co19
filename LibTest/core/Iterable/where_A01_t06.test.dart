/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate f.
 * @description Checks that if predicate function always returns true then
 * resulting collection equals to the initial one
 * @author msyabro
 */
library where_A01_t06;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  List list = new List();
  
  for(int i = 0; i < 100; i++) {
    list.add(i);
  }
  
  Iterable res = create(list).where((var element) {
    return true;
  });
  
  Expect.isTrue(res.length == 100);
  int i = 0;
  Iterator it = res.iterator;
  while(it.moveNext()) {
    Expect.equals(i, it.current);
    i++;
  }
}
