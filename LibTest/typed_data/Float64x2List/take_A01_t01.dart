/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * Returns a lazy iterable of the count first elements of this iterable.
 * @description Checks that an iterable of the count first elements of this
 * iterable is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, int count) {
  var l = new Float64x2List.fromList(list);
  var res = l.take(count);
  Expect.equals(count, res.length);
  for (int i = 0; i < count; ++i) {
    Expect.equals(l[i].x, res.elementAt(i).x);
    Expect.equals(l[i].y, res.elementAt(i).y);
  }
}

main() {
  check([], 0);
  check(
      [f64x2(6.0), f64x2(1.0), f64x2(4.0), f64x2(2.0), f64x2(5.0), f64x2(3.0)],
      3);
  check(
      [f64x2(6.0), f64x2(5.0), f64x2(4.0), f64x2(3.0), f64x2(2.0), f64x2(1.0)],
      6);
}
