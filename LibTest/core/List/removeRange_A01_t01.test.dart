/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void removeRange(int start, int end)
 * Removes the elements in the range start to end exclusive.
 * @description Checks valid removals.
 * @author vasya
 */
library removeRange_A01_t01;

import "../../../Utils/expect.dart";

check(a) {
  var b = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  a.addAll(b);
  Expect.equals(b.length, a.length);
  a.removeRange(5, 10);
  Expect.equals(5, a.length);
  for (var i = 0; i < a.length; i++){
    Expect.equals(i, a[i]);
  }

  a.removeRange(0, 5);
  Expect.equals(0, a.length);

  a.length = 100;
  a[99] = -1;
  a.removeRange(0, 99);
  Expect.equals(1, a.length);
  Expect.equals(-1, a[0]);
}

test(List create([int length])) {
  check(create());
}
