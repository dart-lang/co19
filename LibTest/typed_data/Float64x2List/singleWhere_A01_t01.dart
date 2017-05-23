/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * Returns the single element that satisfies test.
 * @description Checks that returned element is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List.fromList([f64x2(1.0), f64x2(2.0), f64x2(3.0),
      f64x2(4.0,), f64x2(5.0)]);
  var res = l.singleWhere((e) => e.x > 4.0);
  Expect.isTrue(res.x == 5.0 && res.y == 5.0);

  res = l.singleWhere((e) => e.y < 2.0);
  Expect.isTrue(res.x == 1.0 && res.y == 1.0);
}
