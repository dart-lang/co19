/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void fillRange(int start, int end, [E fillValue])
 * Sets the elements in the range start to end exclusive to the given fillValue.
 * @description Checks that the elements in the range start to end exclusive
 * are set to the given fillValue.
 * @author kaigorodov
 */
library fillRange_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a0 = [1, 3, 3, 4, 5, 6];
  List a = create();
  a.length = a0.length;
  a.setRange(0, a0.length, a0);

  a.fillRange(2, 2);
  for (int k = 0; k < a.length; k++) {
    Expect.equals(a0[k], a[k], "k=$k");
  }

  a.fillRange(2, 5);
  for (int k = 0; k < a.length; k++) {
    var expect = (k >= 2 && k < 5) ? null : a0[k];
    Expect.equals(expect, a[k], "k=$k");
  }

  a.fillRange(2, 5, -1);
  for (int k = 0; k < a.length; k++) {
    var expect = (k >= 2 && k < 5) ? -1 : a0[k];
    Expect.equals(expect, a[k], "k=$k");
  }
}
