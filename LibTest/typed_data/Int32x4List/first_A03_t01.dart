/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E first
 * ...
 * Otherwise returns the first element in the iteration order, equivalent to
 * this.elementAt(0).
 * @description Checks that if Int32x4List is not empty the first element in
 * the iteration order is returned (equivalent to this.elementAt(0)).
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
  Expect.isTrue(equal(l.elementAt(0), l.first));
}

main() {
  check([i32x4(1)]);
  check([i32x4(10), i32x4(11), i32x4(12), i32x4(13)]);
  check([i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
      i32x4(7),i32x4(8), i32x4(9)]);
}
