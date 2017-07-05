/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> expand<T>(Iterable<T> f(E element))
 * ...
 * The returned Iterable is lazy, and calls f for each element of this every
 * time it's iterated.
 * @description Checks that returned Iterable is lazy and f is invoked for each
 * element of this every time it's iterated.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void check(List<Float64x2> list) {
  var count = 0;
  var expected = 0;
  var l = new Float64x2List.fromList(list);
  var res = l.expand((element) {
    count++; return [element + element];
  });
  Expect.equals(0, count);

  for (int i = 0; i < list.length; ++i) {
    expected += i + 1;
    var el = res.elementAt(i);
    Expect.equals(expected , count);
    Expect.equals(l[i].x + l[i].x, el.x);
    Expect.equals(l[i].y + l[i].y, el.y);
  }
}

main() {
  check([f64x2(1.0)]);
  check([f64x2(1.0), f64x2(1.0)]);
  check([
    f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0),
    f64x2(10.0), f64x2(11.0), f64x2(12.0), f64x2(13.0), f64x2(14.0),
    f64x2(15.0), f64x2(16.0), f64x2(17.0)
  ]);
}
