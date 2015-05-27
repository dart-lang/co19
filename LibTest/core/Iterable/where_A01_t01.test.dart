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
 * @description Checks that all elements of the returned Iterable satisfy the predicate [f].
 * @author vasya
 * @reviewer iefremov
 */
library where_A01_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content]), {bool isSet:false}) {

  void check(Iterable source, f(element), Iterable expected) {
    Iterable ret = create(source).where(f);
    Iterator it = ret.iterator;
    while(it.moveNext()) {
      Expect.isTrue(f(it.current));
    }
    Expect.iterableEquals(expected, ret);
  }

  bool f(int e) { return (e > 1); }
  check([-1,0,1,2,3,4], f, [2, 3, 4]);
  
  bool f1(Object e) { return (e == null); }
  if (isSet) {
    check([null,[null],"",0,[0,1,2], null], f1, [null]);
  } else {
    check([null,[null],"",0,[0,1,2], null], f1, [null, null]);
  }
    
  bool f2(String e) { return (e == "list"); }
  List l = new List<String>(534768);
  l[53478] = "list";
  check(l, f2, ["list"]);
  
  bool f3(String e) { return (e.isEmpty); }
  check( ["1","2","3"], f3, []);
}
