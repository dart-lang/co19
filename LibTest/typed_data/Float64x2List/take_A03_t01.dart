/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * ...
 * The elements can be computed by stepping through iterator until count
 * elements have been seen.
 * @description Checks that the elements can be computed by stepping through
 * iterator until count elements have been seen.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, int count) {
  var l = new Float64x2List.fromList(list);
  var res = l.take(count);
  var it = res.iterator;
  var counter = 0;
  while (it.moveNext()) {
    counter++;
  }
  Expect.equals(count, counter);
}

main() {
  check([], 0);
  check(
      [f64x2(6.0), f64x2(1.0), f64x2(4.0), f64x2(2.0), f64x2(5.0), f64x2(3.0)],
      4);
  check([
    f64x2(6.0), f64x2(5.0), f64x2(4.0), f64x2(3.0), f64x2(2.0),
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(2.0), f64x2(5.0)
  ], 10);
}
