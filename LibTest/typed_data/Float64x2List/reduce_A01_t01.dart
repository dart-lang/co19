/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * Reduces a collection to a single value by iteratively combining elements of
 * the collection using the provided function.
 * @description Checks that the correct value is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, Float64x2 expected) {
  var l = new Float64x2List.fromList(list);
  var res = l.reduce((prev, cur) => prev + cur);
  Expect.equals(expected.x, res.x);
  Expect.equals(expected.y, res.y);
}

checkConst(List<Float64x2> list, Float64x2 expected) {
  var l = new Float64x2List.fromList(list);
  var res = l.reduce((prev, cur) => f64x2(11.0));
  Expect.equals(expected.x, res.x);
  Expect.equals(expected.y, res.y);
}

main() {
  check([f64x2(1.0), f64x2(2.0)], f64x2(3.0));
  check([f64x2(1.0), f64x2(3.0), f64x2(5.0), f64x2(7.0), f64x2(9.0)],
      f64x2(25.0));

  checkConst([f64x2(1.0), f64x2(2.0)], f64x2(11.0));
  checkConst([f64x2(1.0), f64x2(3.0), f64x2(5.0), f64x2(7.0), f64x2(9.0)],
      f64x2(11.0));
}
