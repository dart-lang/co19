/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void sort([int compare(E a, E b) ])
 * Sorts this list according to the order specified by the compare function.
 * @description Checks that list is sorted according to the order specified by
 * the compare function.
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

check(List<Float64x2> list, List<Float64x2> expected) {
  var l = new Float64x2List.fromList(list);
  int c(var a, var b) {
    return a.x < b.x ? -1 : (a.x == b.x ? 0 : 1);
  }
  l.sort(c);
  listEquals(expected, l);
}

main() {
  check([], []);
  check([f64x2(1.0), f64x2(2.0)], [f64x2(1.0), f64x2(2.0)]);
  check(
      [f64x2(6.0), f64x2(1.0), f64x2(4.0), f64x2(2.0), f64x2(5.0), f64x2(3.0)],
      [f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0), f64x2(6.0)]);
  check(
      [f64x2(6.0), f64x2(5.0), f64x2(4.0), f64x2(3.0), f64x2(2.0), f64x2(1.0)],
      [f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0), f64x2(6.0)]);
}
