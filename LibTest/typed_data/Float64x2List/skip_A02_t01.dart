/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * ...
 * If this has fewer than count elements, then the resulting Iterable is empty.
 * @description Checks that returned element is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, int n) {
  var l = new Float64x2List.fromList(list);
  var res = l.skip(n);
  Expect.isTrue(res.isEmpty);
}

main() {
  check([], 1);
  check([
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0), f64x2(6.0),
    f64x2(7.0), f64x2(8.0), f64x2(9.0)
  ], 10);
  check(new Float64x2List(55), 56);
}
