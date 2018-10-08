/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E first
 * Returns the first element.
 * @description Checks that the first element of a list is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void check(List<Float64x2> list) {
  var l = new Float64x2List.fromList(list);
  Expect.equals(l[0].x, l.first.x);
  Expect.equals(l[0].y, l.first.y);
}

void checkClear(length) {
  var l = new Float64x2List(length);
  Expect.equals(0, l.first.x);
  Expect.equals(0, l.first.y);
}

main() {
  check([f64x2(1.0)]);
  check([f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0)]);
  check([
    f64x2(1.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0),
    f64x2(10.0), f64x2(11.0), f64x2(12.0), f64x2(13.0), f64x2(14.0),
    f64x2(15.0), f64x2(16.0), f64x2(17.0)
  ]);

  checkClear(1);
  checkClear(100);
}
