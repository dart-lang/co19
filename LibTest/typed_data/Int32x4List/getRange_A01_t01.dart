/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * Returns an Iterable that iterates over the objects in the range start
 * inclusive to end exclusive.
 * ...
 * An empty range (with end == start) is valid.
 * @description Checks that the correct iterable is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void check(List<Int32x4> list, int start, int end) {
  var l = new Int32x4List.fromList(list);
  var res = l.getRange(start, end);
  var it = res.iterator;
  var i = start;
  while (it.moveNext()) {
    Expect.isTrue(equal(l[i++], it.current));
  }
}

main() {
  check([], 0, 0);
  check([i32x4(1)], 0, 1);
  check([i32x4(10), i32x4(11), i32x4(12), i32x4(13)], 1, 4);
  check([
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7),i32x4(8), i32x4(9)
  ], 3, 10);
}
