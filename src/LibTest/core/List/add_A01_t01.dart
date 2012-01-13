/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list, extending the length by one.
 * @description Checks extendable lists, that [value] is added to the end of the list
 * and the length is extended by one.
 * @author vasya
 * @author varlax
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

  List<int> b = new List.from(const<int>[]);
  b.add(null);
  Expect.isNull(b[0]);
  for (var i = 1; i <= 314148; i++) {
    b.add(i);
    Expect.equals(i, b[i]);
    Expect.equals(i+1, b.length);
  }
}
