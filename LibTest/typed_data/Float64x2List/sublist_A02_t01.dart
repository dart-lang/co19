/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * ...
 * If end is omitted, the length of this is used.
 * @description Checks that if end is omitted, the length of this is used.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, int start) {
  var l = new Float64x2List.fromList(list);
  var res = l.sublist(start);
  for (int i = start; i < l.length; ++i) {
    Expect.equals(l[i].x, res[i - start].x);
    Expect.equals(l[i].y, res[i - start].y);
  }
}

main() {
  check([], 0);
  check(
      [f64x2(6.0), f64x2(1.0), f64x2(4.0), f64x2(2.0), f64x2(5.0), f64x2(3.0)],
      2);
  check(
      [f64x2(6.0), f64x2(5.0), f64x2(4.0), f64x2(3.0), f64x2(2.0), f64x2(1.0)],
      0);
}
