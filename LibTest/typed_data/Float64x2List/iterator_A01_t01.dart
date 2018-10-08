/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterator<E> iterator
 * Returns a new Iterator that allows iterating the elements of this Iterable.
 * @description Checks that returned Iterator can iterate the elements of this
 * Iterable.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2V(v) => new Float64x2.splat(v);

void check(List<Float64x2> list) {
  Float64x2List l = new Float64x2List.fromList(list);
  var it = l.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.isTrue(l[i].x == it.current.x);
    Expect.isTrue(l[i++].y == it.current.y);
  }
  Expect.isTrue(l.length == i);
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
