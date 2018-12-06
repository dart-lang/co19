/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * Returns a new list containing the objects from start inclusive to end
 * exclusive.
 * @description Checks that the returned list contains the objects from start
 * inclusive to end exclusive.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

check(List<Int32x4> list, start, end) {
  var l = new Int32x4List.fromList(list);
  var res = l.sublist(start, end);

  for (int i = start; i < end; ++i) {
    Expect.isTrue(equal(l[i], res[i - start]));
  }
}

main() {
  check([], 0, 0);
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7), i32x4(8), i32x4(9)
  ];
  check(list, 0, 0);
  check(list, 0, 10);
  check(list, 2, 10);
  check(list, 3, 8);
  check(list, 10, 10);
  check(list, 9, 10);
}
