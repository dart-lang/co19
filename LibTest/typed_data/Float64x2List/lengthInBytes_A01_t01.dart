/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lengthInBytes
 * Returns the length of this view, in bytes.
 * @description Checks that the length in bytes of a list is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void check(List<Float64x2> list) {
  var l = new Float64x2List.fromList(list);
  Expect.equals(l.length * Float64x2List.bytesPerElement, l.lengthInBytes);
}

main() {
  check([f64x2(1.0)]);
  check([f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0)]);
  check([
    f64x2(1.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0),
    f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0), f64x2(0.0),
    f64x2(0.0), f64x2(0.0), f64x2(0.0)
  ]);
}
