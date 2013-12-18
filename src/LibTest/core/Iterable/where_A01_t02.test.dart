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
 * @description Checks that the predicate method is called for all elements of the list as long as the resulting
 * iterable is iterated over to the end.
 * @author vasya
 * @reviewer iefremov
 */
library where_A01_t02;
 
import "../../../Utils/expect.dart";

class A {
  A(bool checked) { this.checked = checked;  }
  bool checked;
}

test(Iterable create([Iterable content]), {bool isSet:false}) {

  List<A> a = new List(100);
  for(var i = 0; i < a.length; i++) {
    a[i] = new A(false);
  }

  bool f(A e) { 
    e.checked = true; 
    return false; 
  }

  Iterable ret = create(a).where(f);
  Iterator it = ret.iterator;
  while(it.moveNext()) {}
  
  Iterator ait = a.iterator;
  while(ait.moveNext()) {
    Expect.isTrue(ait.current.checked);
  }
}
