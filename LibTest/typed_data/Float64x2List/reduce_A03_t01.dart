/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * ...
 * If it has only one element, that element is returned.
 * @description Checks that if it has only one element in a list, that element
 * is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List.fromList([f64x2(1.0)]);
  var res = l.reduce((prev, cur) => prev + cur);
  Expect.equals(l[0].x, res.x);
  Expect.equals(l[0].y, res.y);

  res = l.reduce((prev, cur) => f64x2(11.0));
  Expect.equals(l[0].x, res.x);
  Expect.equals(l[0].y, res.y);
}
