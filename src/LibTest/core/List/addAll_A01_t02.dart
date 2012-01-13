/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Appends all elements of the collection to the end of list.
 * Extends the length of the list by the length of collection.
 * @description Checks that method does not affect the previous content of the list
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
  Expect.isTrue(a.length == 0);
  List b = ["1","2","3"];
  a.addAll(b);
  checkArrayEquals(["1", "2", "3"], a);

  a.addAll([null,0, false, "0"]);
  checkArrayEquals(["1", "2", "3", null, 0, false, "0"], a);
}
