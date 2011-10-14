/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list, extending the length by one.
 * @description Checks that [value] is added to the end of the list
 * and the length is extended by one.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 */

main() {
  List a = new List();
  for (var i = 0; i <= 314148; i++) {
    a.add(i);
    Expect.equals(i, a[i]);
    Expect.equals(i+1, a.length);
  }
}
