/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fillRange(int start, int end, [E fillValue])
 * Sets the objects in the range start inclusive to end exclusive to the given
 * fillValue.
 * @description Checks that the elements are set correctly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List(100);
  l.fillRange(0, 100, f64x2(1.0));
  for (int i = 0; i < 100; ++i) {
    Expect.equals(1.0, l[i].x);
    Expect.equals(1.0, l[i].y);
  }

  l.fillRange(0, 8, f64x2(2.0));
  for (int i = 0; i < 8; ++i) {
    Expect.equals(2.0, l[i].x);
    Expect.equals(2.0, l[i].y);
  }
  Expect.equals(1.0, l[8].x);
  Expect.equals(1.0, l[8].y);

  l.fillRange(20, 29, f64x2(3.0));
  for (int i = 20; i < 29; ++i) {
    Expect.equals(3.0, l[i].x);
    Expect.equals(3.0, l[i].y);
  }
  Expect.equals(1.0, l[29].x);
  Expect.equals(1.0, l[29].y);

  l.fillRange(0, 100, f64x2(4.0));
  l.fillRange(0, 0, f64x2(5.0));
  for (int i = 0; i < 100; ++i) {
    Expect.equals(4.0, l[i].x);
    Expect.equals(4.0, l[i].y);
  }
}
