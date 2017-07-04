/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * ...
 * If end is omitted, the length of this is used.
 * @description Checks that if end is omitted, the length of this is used.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

check(l, start) {
  var res = l.sublist(start);

  for (int i = start; i < l.length; ++i) {
    Expect.isTrue(equal(l[i], res[i - start]));
  }
}

main() {
  check(new Int32x4List(0), 0);
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7), i32x4(8), i32x4(9)
  ];
  var l = new Int32x4List.fromList(list);
  for (int i = 0; i <= l.length; ++i) {
    check(l, i);
  }
}
