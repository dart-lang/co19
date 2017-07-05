/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E element), {E orElse()})
 * ...
 * If no element satisfies test, the result of invoking the orElse function is
 * returned.
 * @description Checks that the result of invoking the orElse function is
 * returned if no element satisfies test.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var count = 0;
  Float64x2 f() {
    count++;
    return f64x2(20.0);
  }
  var l = new Float64x2List.fromList([
    f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0), f64x2(10.0),
    f64x2(11.0), f64x2(12.0), f64x2(13.0), f64x2(14.0), f64x2(15.0),
    f64x2(16.0), f64x2(17.0)
  ]);
  var res = l.lastWhere((element) => element.x > 20, orElse: f);
  Expect.equals(1, count);
  Expect.equals(20.0, res.x);
  Expect.equals(20.0, res.y);

  res = l.lastWhere((element) => false, orElse: f);
  Expect.equals(2, count);
  Expect.equals(20.0, res.x);
  Expect.equals(20.0, res.y);

  l = new Float64x2List.fromList([]);
  res = l.lastWhere((element) => true, orElse: f);
  Expect.equals(3, count);
  Expect.equals(20.0, res.x);
  Expect.equals(20.0, res.y);
}
