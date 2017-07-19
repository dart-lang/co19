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
 * @description Checks that if width or height are negative, they are clamped
 * to zero.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, -20, -15);

  Expect.equals(0, r.width);
  Expect.equals(0, r.height);
}
