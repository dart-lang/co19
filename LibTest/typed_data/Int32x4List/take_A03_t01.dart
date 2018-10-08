/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * ...
 * The count must not be negative.
 * @description Checks that the count must not be negative.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7), i32x4(8), i32x4(9)
  ];
  var l = new Int32x4List(0);
  Expect.throws(() {
    l.take(-1);
  });

  l = new Int32x4List.fromList(list);
  Expect.throws(() {
    l.take(-11);
  });
}
