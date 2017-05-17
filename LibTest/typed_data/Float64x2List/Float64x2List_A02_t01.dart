/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2List(int length)
 * It is an error if length is not a non-negative number.
 * @description Checks that an error if length is a non-negative number.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(dynamic length) {
  Expect.throws(() {
    new Float64x2List(length);
  });
}

main() {
  check(-1);
  check(-10);
  check(-0.5);
  check(3.0);
  check("11");
  check(new Object());
  check([0]);
}
