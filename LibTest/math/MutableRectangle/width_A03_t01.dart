/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void width=(T width)
 * The width must be non-negative. If a negative width is supplied, it is
 * clamped to zero.
 * @description Checks that if the width is negative, it is clamped to zero.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);
  Expect.equals(20, r.width);
  r.width = -11;
  Expect.equals(0, r.width);
  r.width = -1.1;
  Expect.equals(0, r.width);
  r.width = -double.maxFinite;
  Expect.equals(0, r.width);
  r.width = -double.minPositive;
  Expect.equals(0, r.width);
}
