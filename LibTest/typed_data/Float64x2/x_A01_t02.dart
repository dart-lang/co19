/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double x
 * Extracted x value.
 * @description Checks that x is read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic fl64x2 = new Float64x2(0.0, 0.0);
  try {
    fl64x2.x = 1.0;
    Expect.fail("x should be read-only");
  } on Error {}
}
