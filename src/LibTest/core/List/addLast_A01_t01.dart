/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list, extending the length by one.
 * @description Checks that [value] is appended to the end of the list.
 * @author vasya
 * @reviewer msyabro
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";
 

main() {
  List a = new List();
  for (var i = 0; i <= 214748; i++) {
    a.addLast(i);
    Expect.equals(i, a[i]);
    Expect.equals(i+1, a.length);
  }

  a = [];
  for (var i = 0; i <= 214748; i++) {
    a.addLast(i);
    Expect.equals(a[i], i);
    Expect.equals(i+1, a.length);
  }
}
