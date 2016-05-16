/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate f.
 * @description Checks that this method returns correct collection for various
 * predicates.
 * @author msyabro
 */
library where_A01_t07;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content]), {bool isSet:false}) {
  List list = new List();
  
  for(int i = 0; i < 101; i++) {
    list.add(i - 50);
  }
  
  Iterable a = create(list).where((var element) {
    return element > 0;
  });
  Expect.isTrue(a.length == 50);
  Expect.iterableEquals(list.getRange(51, 101), a);
  
  a = create(list).where((var element) {
    return element == 0;
  });
  Expect.isTrue(a.length == 1);
  Expect.isTrue(a.first == 0);
  
  a = create(list).where((var element) {
    return true;
  });
  Expect.isTrue(a.length == 101);
  if (!isSet) {
    Expect.iterableEquals(list, a);
  }
  
  a = create(list).where((var element) {
    return false;
  });
  Expect.isTrue(a.isEmpty);
}
