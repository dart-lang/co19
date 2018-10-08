/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void height=(T height)
 * The height must be non-negative. If a negative height is supplied, it is
 * clamped to zero.
 * @description Checks that if the height is negative, it is clamped to zero.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);
  Expect.equals(15, r.height);
  r.height = -11;
  Expect.equals(0, r.height);
  r.height = -1.0;
  Expect.equals(0, r.height);
  r.height = -double.maxFinite;
  Expect.equals(0, r.height);
  r.height = -double.minPositive;
  Expect.equals(0, r.height);
}
