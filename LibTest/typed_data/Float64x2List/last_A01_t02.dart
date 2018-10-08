/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E last
 * Returns the last element.
 * @description Checks that [last] can be set.
 * @author ngl@unipro.ru
 * @author sgrekhov@unipro.ru
 * @issue dart-lang/co19#130
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void check(List<Float64x2> array) {
  dynamic l = new Float64x2List.fromList(array);
  l.last = f64x2(3.14);
  Expect.equals(3.14, l.last.x);
  Expect.equals(3.14, l.last.y);
}

void checkClear(int length) {
  dynamic l = new Float64x2List(length);
  l.last = f64x2(3.14);
  Expect.equals(3.14, l.last.x);
  Expect.equals(3.14, l.last.y);
}

main() {
  check([f64x2(1.0)]);
  check([f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0)]);
  check([
    f64x2(1.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0),
    f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0),
    f64x2(0.0), f64x2(0.0), f64x2(2.0)
  ]);

  checkClear(1);
  checkClear(100);
}
