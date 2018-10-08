/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void width=(T width)
 * Sets the width of the rectangle.
 * @description Checks that the width is set correctly.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);
  Expect.equals(20, r.width);
  r.width = 30;
  Expect.equals(30, r.width);
  r.width = 3.5;
  Expect.equals(3.5, r.width);
  r.width = double.infinity;
  Expect.equals(double.infinity, r.width);
  r.width = double.maxFinite;
  Expect.equals(double.maxFinite, r.width);
  r.width = double.minPositive;
  Expect.equals(double.minPositive, r.width);
}
