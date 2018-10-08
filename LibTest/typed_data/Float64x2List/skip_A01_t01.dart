/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * Returns an Iterable that provides all but the first count elements.
 * @description Checks that returned Iterable is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, int n) {
  var l = new Float64x2List.fromList(list);
  var res = l.skip(n);
  for (int i = 0; i < res.length; ++i) {
    Expect.isTrue(l[i + n].x == res.elementAt(i).x &&
        l[i + n].y == res.elementAt(i).y);
  }
}

main() {
  check([], 0);

  for (int i = 0; i < 9; ++i) {
    check([
      f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0),
      f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
    ], i);
  }
}
