/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * ...
 * The returned Iterable may contain fewer than count elements, if this contains
 * fewer than count elements.
 * @description Checks that if the returned Iterable may contain fewer than
 * count elements, if this contains fewer than count elements.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

check(List<Int32x4> list, n) {
  var l = new Int32x4List.fromList(list);
  var res = l.take(n);

  Expect.equals(l.length, res.length);
  Expect.isTrue(res.length < n);
  for (int i = n; i < n; ++i) {
    Expect.isTrue(equal(l[i], res.elementAt(i)));
  }
}

main() {
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7), i32x4(8), i32x4(9)
  ];
  check([], 2);
  check([i32x4(1), i32x4(2)], 4);
  check(list, 11);
  check(list, 100);
}
