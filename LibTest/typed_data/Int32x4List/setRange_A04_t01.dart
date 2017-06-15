/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setRange(
 *     int start,
 *     int end,
 *     Iterable<E> iterable, [
 *     int skipCount = 0
 * ])
 * ...
 * If iterable is this list, the operation copies the elements originally in the
 * range from skipCount to skipCount + (end - start) to the range start to end,
 * even if the two ranges overlap.
 * @description Checks that the elements of this list are set correctly, even
 * if the two ranges overlap.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void listEquals(l, expected) {
  for (int i = 0; i < l.length; ++i) {
    Expect.isTrue(equal(l[i], expected[i]));
  }
}

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);

  l.setRange(1, 3, l, 2);
  Expect.equals(list.length, l.length);
  listEquals([i32x4(0), i32x4(2), i32x4(3), i32x4(3), i32x4(4), i32x4(5)], l);

  l.setRange(4, 6, l, 2);
  Expect.equals(list.length, l.length);
  listEquals([i32x4(0), i32x4(2), i32x4(3), i32x4(3), i32x4(3), i32x4(3)], l);
}
