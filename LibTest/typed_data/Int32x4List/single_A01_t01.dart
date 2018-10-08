/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E single
 * Checks that this iterable has only one element, and returns that element.
 * @description Checks that correct element is returned, if this list has only
 * one element.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

main() {
  var l = new Int32x4List.fromList([i32x4(1)]);
  Expect.isTrue(equal(i32x4(1), l.single));

  l = new Int32x4List.fromList([i32x4(11)]);
  Expect.isTrue(equal(i32x4(11), l.single));

  l = new Int32x4List.fromList([i32x4(21)]);
  Expect.isTrue(equal(i32x4(21), l.single));
}
