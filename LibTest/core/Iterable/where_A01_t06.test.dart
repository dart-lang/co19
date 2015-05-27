/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate f.
 * This method returns a view of the mapped elements. 
 * As long as the returned Iterable is not iterated over, the supplied function f will not be invoked. 
 * Iterating will not cache results, and thus iterating multiple times over the the returned Iterable 
 * will invoke the supplied function f multiple times on the same element.
 * @description Checks that as long as the resulting collection is iterated over to the end,
 * the target collection is too.
 * @author msyabro
 * @reviewer varlax
 */
library where_A01_t06;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content]), {bool isSet:false}) {
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
