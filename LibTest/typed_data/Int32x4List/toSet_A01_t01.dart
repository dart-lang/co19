/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> toSet()
 * Creates a Set containing the same elements as this iterable.
 * @description Checks that the returned Set is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

check(List<Int32x4> list) {
  var l = new Int32x4List.fromList(list);
  var res = l.toSet();
  Expect.equals(l.length, res.length);
  for (int i = 0; i < res.length; ++i) {
    Expect.isTrue(res.any((x) => equal(l[i], x)));
  }
}

main() {
  check([]);
  check([i32x4(7)]);
  check([i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5)]);
  check([
    i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5), i32x4(6),
    i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5), i32x4(6),
    i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5), i32x4(6),
    i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5), i32x4(6),
    i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5), i32x4(6)
  ]);
}
