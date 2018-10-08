/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void sort([int compare(E a, E b)])
 * Sorts the list according to the order specified by the compare function.
 * @description Checks sorting various Int32x4List.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

listEquals(expected, actual) {
  Expect.equals(expected.length, actual.length);
  for (int i = 0; i < expected.length; ++i) {
    Expect.isTrue(equal(expected[i], actual[i]));
  }
}

void check(List<Int32x4> list, List expected) {
  var actual = new Int32x4List.fromList(list);
  int c(var a, var b) {
    return a.x < b.x ? -1 : (a.x == b.x ? 0 : 1);
  }
  actual.sort(c);
  listEquals(expected, actual);
}

main() {
  check([], []);
  check([i32x4(2)], [i32x4(2)]);
  check([i32x4(2), i32x4(1)], [i32x4(1), i32x4(2)]);
  check([i32x4(1), i32x4(2), i32x4(4), i32x4(3), i32x4(5), i32x4(6)],
      [i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6)]);
  check([i32x4(2), i32x4(1), i32x4(4), i32x4(3), i32x4(6), i32x4(5)],
      [i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6)]);
  check([i32x4(6), i32x4(5), i32x4(4), i32x4(3), i32x4(2), i32x4(1)],
      [i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6)]);
  check([
    i32x4(9), i32x4(1), i32x4(3), i32x4(0), i32x4(2), i32x4(2), i32x4(3),
    i32x4(9), i32x4(5), i32x4(7), i32x4(5), i32x4(1), i32x4(4), i32x4(8),
    i32x4(8), i32x4(4), i32x4(6), i32x4(7), i32x4(6), i32x4(0)
  ], [
    i32x4(0), i32x4(0), i32x4(1), i32x4(1), i32x4(2), i32x4(2), i32x4(3),
    i32x4(3), i32x4(4), i32x4(4), i32x4(5), i32x4(5), i32x4(6), i32x4(6),
    i32x4(7), i32x4(7), i32x4(8), i32x4(8), i32x4(9), i32x4(9)
  ]);
}
