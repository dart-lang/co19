/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2List.fromList(List<Float64x2> elements)
 * Creates a [Float64x2List] with the same length as the [elements] list and
 * copies over the elements.
 * @description Checks that an instance of Float64x2List has the same length
 * and element values as [elements] list.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(x, y) => new Float64x2(x,y);
Float64x2 f64x2V(v) => new Float64x2.splat(v);

void check(List<Float64x2> list) {
  Float64x2List l = new Float64x2List.fromList(list);
  Expect.equals(l.length, list.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(list[i].x, l[i].x);
    Expect.equals(list[i].y, l[i].y);
  }
  Expect.isTrue(l is Float64x2List);
}

main() {
  check([]);
  check([f64x2(3.4028234663852886e38, 1.401298464324817e-45)]);
  check([f64x2(1.1754943508222875e-38, -.0)]);
  check([
    f64x2(2e-10, 4e12), f64x2(.012e10, 1e15), f64x2(-2e-10, -1.2e1),
    f64x2(-0.23, -4.98e-1), f64x2(2e10, 3e-1), f64x2(1.12, 0.5e-1)
  ]);
  check([
    f64x2V(0.0), f64x2V(1.0), f64x2V(2.0), f64x2V(3.0), f64x2V(4.0),
    f64x2V(5.0), f64x2V(6.0), f64x2V(7.0), f64x2V(8.0), f64x2V(9.0),
    f64x2V(10.0), f64x2V(11.0), f64x2V(12.0), f64x2V(13.0), f64x2V(14.0),
    f64x2V(15.0), f64x2V(16.0), f64x2V(17.0)
  ]);
}
