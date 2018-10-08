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
 * @description Checks that the iterable must not have more elements than what
 * can fit from index to length.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

listEquals(Float64x2List expected, Float64x2List actual) {
  Expect.equals(expected.length, actual.length);
  for (int i = 0; i < expected.length; ++i) {
    Expect.equals(expected[i].x, actual[i].x);
    Expect.equals(expected[i].y, actual[i].y);
  }
}

main() {
  var l = new Float64x2List.fromList([]);
  Expect.throws(() {
    l.setAll(0, [f64x2(1.0)]);
  });

  l = new Float64x2List(2);
  Expect.throws(() {
    l.setAll(0, [f64x2(1.0), f64x2(1.0), f64x2(1.0)]);
  });

  l = new Float64x2List(4);
  Expect.throws(() {
    l.setAll(1, [f64x2(1.0), f64x2(1.0), f64x2(1.0), f64x2(1.0)]);
  });

  l = new Float64x2List(5);
  Expect.throws(() {
    l.setAll(3, [f64x2(1.0), f64x2(1.0), f64x2(1.0)]);
  });
}
