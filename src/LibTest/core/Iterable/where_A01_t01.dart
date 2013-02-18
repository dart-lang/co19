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
import "../../../Utils/expect.dart";

main() {
  List l;
  bool f(int e) { return (e > 1); }

  Iterable ret = [-1,0,1,2,3,4].where(f);
  Iterator it = ret.iterator;
  while(it.moveNext()) {
    Expect.isTrue(f(it.current));
  }
  Expect.listEquals([2, 3, 4], new List.from(ret));

  ret = new List.from([-1,0,1,2,3,4]).where(f);
  it = ret.iterator;
  while(it.moveNext()) {
    Expect.isTrue(f(it.current));
  }
  Expect.listEquals([2, 3, 4], new List.from(ret));

  ret = const [-1,0,1,2,3,4].where(f);
  it = ret.iterator;
  while(it.moveNext()) {
    Expect.isTrue(f(it.current));
  }
  Expect.listEquals([2, 3, 4], new List.from(ret));

  l = new List();
  l.addAll([-1,0,1,2,3,4]);
  ret = l.where(f);
  it = ret.iterator;
  while(it.moveNext()) {
    Expect.isTrue(f(it.current));
  }
  Expect.listEquals([2, 3, 4], new List.from(ret));

  
  bool f1(Object e) { return (e == null); }
  
  l = [null,[null],"",0,[0,1,2], null];
  ret = l.where(f1);
  it = ret.iterator;
  while(it.moveNext()) {
    Expect.isTrue(f1(it.current));
  }
  Expect.listEquals([null, null], new List.from(ret));

  
  bool f2(String e) { return (e == "list"); }
  
  l = new List<String>(534768);
  l[53478] = "list";
  ret = l.where(f2);
  it = ret.iterator;
  while(it.moveNext()) {
    Expect.isTrue(f2(it.current));
  }
  Expect.listEquals(["list"], new List.from(ret));

  
  bool f3(String e) { return (e.isEmpty); }
  
  ret = ["1","2","3"].where(f3);
  Expect.equals(0, ret.length);
  Expect.isTrue(ret.isEmpty);
}
