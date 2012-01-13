/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list, extending the length by one.
 * @description Checks that the length is extended by one.
 * @author vasya
 * @reviewer msyabro
 */

main() {
  List a = new List();
  a.addLast("1");
  Expect.equals(a.length, 1);
  a.addLast("2");
  Expect.equals(a.length, 2);
  a.addLast(null);
  Expect.equals(a.length, 3);
  a.addLast("");
  Expect.equals(a.length, 4);
  a.addLast([]);
  Expect.equals(a.length, 5);
  
  a.clear();
  for (var i = 0; i < 214748; i++) {
    a.addLast(i);
    Expect.equals(a.length, i+1);
  }
}
