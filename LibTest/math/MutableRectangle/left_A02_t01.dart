/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T left
 * Setting the value will move the rectangle without changing its width.
 * @description Checks that setting the value will not change width of the
 * rectangle.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);
  Expect.equals(2, r.left);
  var width1 = r.width;
  r.left = -1;
  Expect.equals(-1, r.left);
  var width2 = r.width;
  Expect.equals(width1, width2);
}
