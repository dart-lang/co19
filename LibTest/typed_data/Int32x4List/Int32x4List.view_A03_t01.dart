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
 * ...
 * If the offsetInBytes index of the region is not specified, it defaults to
 * zero (the first byte in the byte buffer).
 * @description Checks that if the offsetInBytes index of the region is not
 * specified, it defaults to zero (the first byte in the byte buffer).
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void check(list) {
  var l = new Int32x4List.fromList(list);
  var buffer = l.buffer;
  var view = new Int32x4List.view(buffer);
  Expect.isTrue(view is Int32x4List);
  Expect.equals(view.length, l.length);
  Expect.isTrue(equal(l[0], view[0]));
  Expect.isTrue(equal(l[l.length - 1], view[view.length - 1]));
}

main() {
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7),i32x4(8), i32x4(9)
  ];
  check([i32x4(1)]);
  check(list);
  check(list);
  check(list);
}
