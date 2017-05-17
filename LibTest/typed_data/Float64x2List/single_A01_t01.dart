/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E single
 * Checks that this iterable has only one element, and returns that element.
 * @description Checks that if iterable has only one element, it is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void check(List<Float64x2> list) {
  var l = new Float64x2List.fromList(list);
  Expect.equals(l[0].x, l.single.x);
  Expect.equals(l[0].y, l.single.y);
}

main() {
  check([f64x2(1.0)]);
  check([f64x2(25.0)]);
  check([f64x2(125.0)]);
}
