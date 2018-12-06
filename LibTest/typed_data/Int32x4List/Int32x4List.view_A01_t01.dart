/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Int32x4List.view(
 *    ByteBuffer buffer, [
 *    int offsetInBytes = 0,
 *    int length
 * ])
 * Creates a Int32x4List view of the specified region in buffer.
 * @description Checks that an instance of Int32x4List of specified length with
 * correct elements is created.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void check(List<Int32x4> list, offset, length) {
  var l = new Int32x4List.fromList(list);
  var buffer = l.buffer;
  var view = new Int32x4List.view(buffer, offset, length);
  Expect.isTrue(view is Int32x4List);
  Expect.equals(view.length, length);
  for (int i = 0; i < view.length; ++i) {
    Expect.isTrue(equal(l[i + (offset >> 4)], view[i]));
  }
}

main() {
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7),i32x4(8), i32x4(9)
  ];
  check([], 0, 0);
  check([i32x4(1)], 0, 1);
  check(list, 0, 10);
  check(list, 2 * Int32x4List.bytesPerElement, 8);
  check(list, 3 * Int32x4List.bytesPerElement, 6);
}
