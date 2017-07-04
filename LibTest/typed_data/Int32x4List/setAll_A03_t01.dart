/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * ...
 * The iterable must not have more elements than what can fit from index to
 * length.
 * @description Checks that an error is thrown if iterable has more elements
 * than what can fit from index to length.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);

  Expect.throws(() {
    l.setAll(4, [i32x4(0), i32x4(1), i32x4(2)]);
  });

  Expect.throws(() {
    l.setAll(6, [i32x4(0)]);
  });

  Expect.throws(() {
    l.setAll(0,
        [i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6), i32x4(7)]);
  });
}
