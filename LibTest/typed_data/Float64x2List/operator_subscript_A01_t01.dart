/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator [](int index)
 * Returns the object at the given index in the list.
 * @description Checks that the element at the given index is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2V(v) => new Float64x2.splat(v);

check(List<Float64x2> list) {
  var l = new Float64x2List.fromList(list);
  for (int i = 0; i < list.length; ++i) {
    Expect.isTrue(l.elementAt(i).x == l[i].x);
    Expect.isTrue(l.elementAt(i).y == l[i].y);
  }
}

main() {
  check([]);
  check([f64x2V(1.0)]);
  check([
    f64x2V(0.0), f64x2V(1.0), f64x2V(2.0), f64x2V(3.0), f64x2V(4.0),
    f64x2V(5.0), f64x2V(6.0), f64x2V(7.0), f64x2V(8.0), f64x2V(9.0),
    f64x2V(10.0), f64x2V(11.0), f64x2V(12.0), f64x2V(13.0), f64x2V(14.0),
    f64x2V(15.0), f64x2V(16.0), f64x2V(17.0)
  ]);
}
