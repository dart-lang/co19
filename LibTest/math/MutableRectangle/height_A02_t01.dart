/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void height=(T height)
 * Sets the height of the rectangle.
 * @description Checks that the height is set correctly.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);
  Expect.equals(15, r.height);
  r.height = 11;
  Expect.equals(11, r.height);
  r.height = 1.5;
  Expect.equals(1.5, r.height);
  r.height = double.infinity;
  Expect.equals(double.infinity, r.height);
  r.height = double.maxFinite;
  Expect.equals(double.maxFinite, r.height);
  r.height = double.minPositive;
  Expect.equals(double.minPositive, r.height);
}
