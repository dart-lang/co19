/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list, extending the length by one.
 * @description Checks that method does not affect previous elements of the list.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

//compares content and length of two arrays
checkArrayEquals(List expected, List actual) {
  Expect.equals(expected.length, actual.length);
  
  for(int i = 0; i < expected.length; i++) {
    Expect.equals(expected[i], actual[i]);
    Expect.identical(expected[i], actual[i]);
  }
}

 
main() {
  List a = new List();
  a.addLast("1");
  checkArrayEquals(["1"], a);
  a.addLast("2");
  checkArrayEquals(["1", "2"], a);
  Expect.equals(a[1], "2");

  a = new List();
  a.addLast(null);
  checkArrayEquals([null], a);
  Expect.equals(a[0], null);
  a.addLast("");
  checkArrayEquals([null, ""], a);
  Expect.equals(a[1], "");
  a.addLast(0);
  checkArrayEquals([null, "", 0], a);
  Expect.equals(a[2], 0);

  a = new List.from([]);
  List b = [null];
  a.addLast(b);
  Expect.equals(a[0], b);
  checkArrayEquals([b], a);
  List c = [];
  a.addLast(c);
  checkArrayEquals([b, c], a);
}
