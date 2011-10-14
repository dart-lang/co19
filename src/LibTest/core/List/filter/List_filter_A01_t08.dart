/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new list with the elements of this list that satisfy the predicate [f].
 * @description Try to change the list from [f].
 * @author msyabro
 * @needsreview 
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
  a.addAll([0,1,2,3,4,5,6,7,8,9]);
  int count = 0;
  List b = a.filter(bool func(var e) {
    a = new List();
    count++;
    return e >= 0;
  });
  Expect.equals(10, count);
  Expect.isTrue(a.isEmpty());
  checkArrayEquals([0,1,2,3,4,5,6,7,8,9], b);
}
