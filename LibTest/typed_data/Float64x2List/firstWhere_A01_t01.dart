/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E element), {E orElse()})
 * Returns the first element that satisfies the given predicate test.
 * Iterates through elements and returns the first to satisfy test.
 * @description Checks that the correct element is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List.fromList([
    f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0), f64x2(10.0),
    f64x2(11.0), f64x2(12.0), f64x2(13.0), f64x2(14.0), f64x2(15.0),
    f64x2(16.0), f64x2(17.0)
  ]);
  var res = l.firstWhere((element) => element.x > 10);
  Expect.equals(11.0, res.x);
  Expect.equals(11.0, res.y);

  res = l.firstWhere((element) => element.x == 12);
  Expect.equals(12.0, res.x);
  Expect.equals(12.0, res.y);

  res = l.firstWhere((element) => element.x < 7);
  Expect.equals(5.0, res.x);
  Expect.equals(5.0, res.y);
}
