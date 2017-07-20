/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double magnitude
 * Get the straight line (Euclidean) distance between the origin (0, 0) and
 * this point.
 * @description Checks that [magnitude] read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";


main() {
  dynamic r = new Point(3, 5);
  try {
    r.magnitude = 1.0;
    Expect.fail("[magnitude] should be read-only");
  } on NoSuchMethodError {}
}
