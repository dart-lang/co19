/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the indexth element.
 * @description Checks that the indexth element of List is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void check(List<Float64x2> list) {
  var l = new Float64x2List.fromList(list);

  for (int i = 0; i < list.length; ++i) {
    Expect.equals(l[i].x, l.elementAt(i).x);
    Expect.equals(l[i].y, l.elementAt(i).y);
  }
}

main() {
  check([]);
  check([f64x2(1.0)]);
  check([f64x2(1.0), f64x2(1.0)]);
  check([
    f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0),
    f64x2(10.0), f64x2(11.0), f64x2(12.0), f64x2(13.0), f64x2(14.0),
    f64x2(15.0), f64x2(16.0), f64x2(17.0)
  ]);
}
