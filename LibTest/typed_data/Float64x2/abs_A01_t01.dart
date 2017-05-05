/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2 abs()
 * Returns the lane-wise absolute value of this Float64x2.
 * @description Checks that every lane of the new [Float64x2] equals the
 * absolute value of the corresponding lane of [this].
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y) {
  var obj = new Float64x2(x, y);
  var res = obj.abs();
  Expect.equals(x.abs(), res.x);
  Expect.equals(y.abs(), res.y);
}

main() {
  check(0.0, 0.0);
  check(-1.0, 2.0);
  check(2e-2, 2e-23, );
  check(0.12e-20, -3.40282e+038);
}
