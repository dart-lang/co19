/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * Overwrites objects of this with the objects of iterable, starting at position
 * index in this list.
 * This operation does not increase the length of this.
 * @description Checks that elements are set correctly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

listEquals(List<Float64x2>  expected, Float64x2List actual) {
  Expect.equals(expected.length, actual.length);
  for (int i = 0; i < expected.length; ++i) {
    Expect.equals(expected[i].x, actual[i].x);
    Expect.equals(expected[i].y, actual[i].y);
  }
}

main() {
  var l = new Float64x2List(9);
  l.setAll(4, [f64x2(1.0)]);
  listEquals([
    f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(1.0),
    f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0)
  ], l);

  l.setAll(5, [f64x2(2.0), f64x2(2.0), f64x2(2.0), f64x2(2.0)]);
  listEquals([
    f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(1.0),
    f64x2(2.0), f64x2(2.0), f64x2(2.0), f64x2(2.0)
  ], l);

  l.setAll(0, [f64x2(3.0), f64x2(3.0), f64x2(3.0)]);
  listEquals([
    f64x2(3.0), f64x2(3.0), f64x2(3.0), f64x2(0.0), f64x2(1.0),
    f64x2(2.0), f64x2(2.0), f64x2(2.0), f64x2(2.0)
  ], l);

  l.setAll(0, [
    f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0),
    f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0)
  ]);
  listEquals([
    f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0),
    f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0)
  ], l);

  l.setAll(0, []);
  listEquals([
    f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0),
    f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0)
  ], l);

  l.setAll(9, []);
  listEquals([
    f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0),
    f64x2(4.0), f64x2(4.0), f64x2(4.0), f64x2(4.0)
  ], l);
}
