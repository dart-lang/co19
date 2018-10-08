/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setRange(
 *     int start,
 *     int end,
 *     Iterable<E> iterable, [
 *     int skipCount = 0
 * ])
 * ...
 * If iterable is this list, the operation copies the elements originally in
 * the range from skipCount to skipCount + (end - start) to the range start to
 * end, even if the two ranges overlap.
 * @description Checks that if iterable is this list, the operation copies
 * elements correctly, even if the two ranges overlap.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

listEquals(List<Float64x2> expected, Float64x2List actual) {
  Expect.equals(expected.length, actual.length);
  for (int i = 0; i < expected.length; ++i) {
    Expect.equals(expected[i].x, actual[i].x);
    Expect.equals(expected[i].y, actual[i].y);
  }
}

main() {
  var l = new Float64x2List.fromList([
    f64x2(1.0), f64x2(2.0), f64x2(3.0),
    f64x2(4.0), f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
  ]);

  l.setRange(4, 5, l, 1);
  listEquals([
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(2.0),
    f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
  ], l);

  l.setRange(3, 7, l);
  listEquals([
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(1.0), f64x2(2.0),
    f64x2(3.0), f64x2(4.0), f64x2(8.0), f64x2(9.0)
  ], l);

  l.setRange(5, 9, l, 2);
  listEquals([
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(1.0), f64x2(2.0),
    f64x2(3.0), f64x2(1.0), f64x2(2.0), f64x2(3.0)
  ], l);
}
