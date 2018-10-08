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
 * An empty range (with end == start) is valid.
 * @description Checks that elements an empty range (with end == start) is
 * valid.
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
  var l = new Float64x2List(9);

  for (int i = 0; i < l.length; ++i) {
    l.setRange(i, i, [f64x2(3.0), f64x2(3.0), f64x2(3.0)]);
    listEquals([
      f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0),
      f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0)
    ], l);
  }
}
