/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * Returns the single element that satisfies test.
 * Checks all elements to see if test(element) returns true. If exactly one
 * element satisfies test, that element is returned.
 * @description Checks that the returned element is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

main() {
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(1), i32x4(8), i32x4(9), i32x4(4), i32x4(5)
  ];
  var l = new Int32x4List.fromList(list);
  var res = l.singleWhere((e) => e.x == 2);
  Expect.isTrue(equal(list[2], res));

  res = l.singleWhere((e) => e.y > 8);
  Expect.isTrue(equal(list[9], res));

  res = l.singleWhere((e) => e.z >= 9);
  Expect.isTrue(equal(list[9], res));

  res = l.singleWhere((e) => e.w < 1);
  Expect.isTrue(equal(list[0], res));
}
