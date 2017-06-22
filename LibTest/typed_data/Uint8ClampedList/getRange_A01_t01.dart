/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * Returns an [Iterable] that iterates over the objects in the range [start]
 * inclusive to [end] exclusive.
 * @description Checks that the correct [Iterable] is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list, int start, int end) {
  var l = new Uint8ClampedList.fromList(list);
  var res = l.getRange(start, end);
  var it = res.iterator;
  var i = start;
  while (it.moveNext()) {
    Expect.equals(l[i++], it.current);
  }
}

main() {
  check([], 0, 0);
  check([1], 0, 1);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 0, 10);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 9, 10);
}
