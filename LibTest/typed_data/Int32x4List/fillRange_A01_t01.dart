/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fillRange(int start, int end, [E fillValue])
 * Sets the objects in the range start inclusive to end exclusive to the given
 * fillValue.
 * @description Checks that specified range is filled with fillValue correctly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

main() {
  var l = new Int32x4List(100);
  l.fillRange(1, 10, i32x4(1));
  Expect.isTrue(equal(i32x4(0), l[0]));
  for (int i = 1; i < 10; ++i) {
    Expect.isTrue(equal(i32x4(1), l[i]));
  }
  Expect.isTrue(equal(i32x4(0), l[10]));

  l.fillRange(11, 21, i32x4(2));
  Expect.isTrue(equal(i32x4(0), l[10]));
  for (int i = 11; i < 21; ++i) {
    Expect.isTrue(equal(i32x4(2), l[i]));
  }
  Expect.isTrue(equal(i32x4(0), l[21]));

  l.fillRange(0, 100, i32x4(3));
  for (int i = 0; i < 100; ++i) {
    Expect.isTrue(equal(i32x4(3), l[i]));
  }

  l.fillRange(3, 3, i32x4(4));
  for (int i = 0; i < 100; ++i) {
    Expect.isTrue(equal(i32x4(3), l[i]));
  }
}
