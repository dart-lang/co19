/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate f.
 * @description Checks that the given function is not executed and an empty
 * collection is returned if this Iterable is empty.
 * @author iefremov
 */
library where_A01_t03;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Iterable a = create([]).where((var v){return true;});
  Iterator it = a.iterator;
  while(it.moveNext()) {}
  Expect.isTrue(a.isEmpty);
  
  a = create([]).where((var v){Expect.fail("Should not be executed");});
  it = a.iterator;
  while(it.moveNext()) {}
  Expect.isTrue(a.isEmpty);
}
