/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies test.
 * Checks every element in iteration order, and returns false if any of them
 * make test return false, otherwise returns true.
 * @description Checks that false is returned if any of elements make test
 * return false, otherwise returns true.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

bool test(Float64x2 element) => element.x > 1.0 && element.y > 1.0;

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var list = [f64x2(1.0)];
  var l = new Float64x2List.fromList(list);
  Expect.isFalse(l.every(test));

  list = [f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0)];
  l = new Float64x2List.fromList(list);
  Expect.isFalse(l.every(test));

  list = [
    f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0), f64x2(6.0),
    f64x2(6.0), f64x2(8.0), f64x2(9.0), f64x2(10.0), f64x2(11.0),
    f64x2(12.0), f64x2(13.0), f64x2(14.0), f64x2(15.0), f64x2(16.0)
  ];
  l = new Float64x2List.fromList(list);
  Expect.isTrue(l.every(test));
}
