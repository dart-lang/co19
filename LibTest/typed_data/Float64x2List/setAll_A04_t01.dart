/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * ...
 * If iterable is based on this list, its values may change /during/ the setAll
 * operation.
 *
 * @description Checks that if iterable is based on this list, its values may
 * change during the setAll operation.
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
  var list = [
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0),
    f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
  ];

  var l = new Float64x2List.fromList(list);
  var buffer = l.buffer;
  var view = new Float64x2List.view(buffer,
      3 * Float64x2List.bytesPerElement, 3);

  listEquals([f64x2(4.0), f64x2(5.0), f64x2(6.0)], view);
  l.setAll(2, view);
  listEquals([
    f64x2(1.0), f64x2(2.0), f64x2(4.0), f64x2(5.0), f64x2(6.0),
    f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
  ], l);

  listEquals([f64x2(5.0), f64x2(6.0), f64x2(6.0)], view);
  l.setAll(4, view);
  listEquals([
    f64x2(1.0), f64x2(2.0), f64x2(4.0), f64x2(5.0), f64x2(5.0),
    f64x2(6.0), f64x2(6.0), f64x2(8.0), f64x2(9.0)
  ], l);

  listEquals([f64x2(5.0), f64x2(5.0), f64x2(6.0)], view);
  l.setAll(0, view);
  listEquals([
    f64x2(5.0), f64x2(5.0), f64x2(6.0), f64x2(5.0), f64x2(5.0),
      f64x2(6.0), f64x2(6.0), f64x2(8.0), f64x2(9.0)
  ], l);

  listEquals([f64x2(5.0), f64x2(5.0), f64x2(6.0)], view);
}
