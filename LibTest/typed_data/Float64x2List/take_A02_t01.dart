/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * ...
 * The returned Iterable may contain fewer than count elements, if this contains
 * fewer than count elements.
 * @description Checks that the returned Iterable may contain fewer than count
 * elements, if this contains fewer than count elements.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, int count) {
  var l = new Float64x2List.fromList(list);
  var res = l.take(count);
  Expect.equals(l.length, res.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i].x, res.elementAt(i).x);
    Expect.equals(l[i].y, res.elementAt(i).y);
  }
  Expect.throws(() {
    res.elementAt(l.length);
  });
  Expect.throws(() {
    res.elementAt(count - 1);
  });
}

main() {
  check([], 3);
  check(
      [f64x2(6.0), f64x2(1.0), f64x2(4.0), f64x2(2.0), f64x2(5.0), f64x2(3.0)],
      7);
  check([
    f64x2(6.0), f64x2(5.0), f64x2(4.0), f64x2(3.0), f64x2(2.0),
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(2.0), f64x2(5.0)
  ], 20);
}
