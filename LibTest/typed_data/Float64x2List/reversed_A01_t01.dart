/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> reversed
 * Returns an Iterable of the objects in this list in reverse order.
 * @description Checks that returned Iterable contains the elements of this
 * in reverse order.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2V(v) => new Float64x2.splat(v);

void check(List<Float64x2> list) {
  Float64x2List l = new Float64x2List.fromList(list);
  var rev = l.reversed;

  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i].x, rev.elementAt(rev.length - 1 - i).x);
    Expect.equals(l[i].y, rev.elementAt(rev.length - 1 - i).y);
  }
}

main() {
  check([]);
  check([f64x2V(21.0)]);
  check([
    f64x2V(0.0), f64x2V(1.0), f64x2V(2.0), f64x2V(3.0), f64x2V(4.0),
    f64x2V(5.0), f64x2V(6.0), f64x2V(7.0), f64x2V(8.0), f64x2V(9.0),
    f64x2V(10.0), f64x2V(11.0), f64x2V(12.0), f64x2V(13.0), f64x2V(14.0),
    f64x2V(15.0), f64x2V(16.0), f64x2V(17.0)
  ]);
}
