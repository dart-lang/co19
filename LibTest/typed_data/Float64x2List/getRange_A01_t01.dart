/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * Returns an Iterable that iterates over the objects in the range start
 * inclusive to end exclusive.
 * @description Checks that the correct Iterable is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void check(List<Float64x2> list, int start, int end) {
  var l = new Float64x2List.fromList(list);
  var res = l.getRange(start, end);
  var it = res.iterator;
  var i = start;
  while (it.moveNext()) {
    Expect.equals(l[i].x, it.current.x);
    Expect.equals(l[i++].y, it.current.y);
  }
}

main() {
  check([], 0, 0);
  check([f64x2(1.0)], 0, 1);
  check([f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0)], 0, 5);
  check([f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0)], 2, 4);
}
