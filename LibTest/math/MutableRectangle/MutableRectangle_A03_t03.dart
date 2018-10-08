/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion MutableRectangle(T left, T top, T width, T height)
 * ...
 * The width and height should be non-negative. If width or height are negative,
 * they are clamped to zero.
 * @description Checks that if width or height are -double.minPositive, they
 * are clamped to zero.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = 
      new MutableRectangle(2, 1, -double.minPositive, -double.minPositive);

  Expect.isTrue((-double.minPositive).isNegative);
  Expect.isTrue((r.width == 0) && (r.height == 0),
      "width = ${r.width} height = ${r.height}");
}
