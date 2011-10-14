/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Appends all elements of the collection to the end of list.
 * Extends the length of the list by the length of collection.
 * @description Checks that all elements of the [collection] are added to the end of list.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 */

checkArrayEquals(List expected, List actual) {
  Expect.equals(expected.length, actual.length);
  for(int i = 0; i < expected.length; i++) {
    Expect.equals(expected[i], actual[i]);
    Expect.identical(expected[i], actual[i]);
  }
}
 
main() {
  List a = new List();
  List b = new List(1000);
  for (var i = 0; i < b.length; i++){
    b[i] = i;
  }
  a.addAll(b);
  Expect.equals(b.length, a.length);
  for (var i = 0; i < b.length; i++){
    Expect.equals(b[i], a[i]);
  }
  
  a = new List();
  Set set = new Set.from([1, 2, 3, 4, 5]);
  a.addAll(set);
  checkArrayEquals([1, 2, 3, 4, 5], a);
  
  a = new List();
  Queue list = new Queue();
  list.addLast(1);
  list.addLast(2);
  a.addAll(list);
  checkArrayEquals([1, 2],a);
  
  a = new List();
  a.addAll([]);
  checkArrayEquals([], a);
  
  a = new List();
  a.addAll(new Queue());
  checkArrayEquals([], a);
  
  a = new List();
  a.addAll(new Set());
  checkArrayEquals([], a);
}
