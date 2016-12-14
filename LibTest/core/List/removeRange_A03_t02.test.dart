/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void removeRange(int start, int end)
 * An error occurs if start.. end is not a valid range for this.
 * @description Checks that an [RangeError] is thrown
 * if [start] or [end] are out of range.
 * @author vasya
 */
library removeRange_A03_t02;

import "../../../Utils/expect.dart";

checkList(l, start, end) {
  Expect.throws(() {l.removeRange(start, end);}, (e) => e is RangeError);
}

test(List create([int length])) {

  void check(int listSize, int start, int end) {
    List l = create();
    l.length = listSize;
    checkList(l, start, end);
  }

  check(0, 0, 1);
  check(1, 1, 2);
  check(100, 99, 101);
  check(799, 0, 800);
}
