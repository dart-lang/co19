/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * ...
 * If this has fewer than count elements, then the resulting Iterable is empty.
 * @description Checks that if this has fewer than count elements, then the
 * resulting Iterable is empty.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

check(List<Int32x4> list, int n) {
  var l = new Int32x4List.fromList(list);
  var res = l.skip(n);
  Expect.isTrue(res.isEmpty);
}

main() {
  check([], 1);
  check([i32x4(0), i32x4(1), i32x4(2), i32x4(3)], 5);
  check(new Int32x4List(24), 25);
}
