/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list, extending the length by one.
 * @description Checks that method does not affect the existing content of the list
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @reviewer varlax
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
  Expect.isTrue(a.length == 0);
  a.add(null);
  checkArrayEquals([null], a);
  a.add(0);
  checkArrayEquals([null, 0], a);
  a.add("1");
  checkArrayEquals([null, 0, "1"], a);
}
