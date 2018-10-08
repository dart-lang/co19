/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void width=(T width)
 * Setting the value will change the right edge of the rectangle, but will not
 * change left.
 * @description Checks that setting the value will change the right edge of the
 * rectangle, but will not change left.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);
  var left1 = r.left;
  var right1 = r.right;
  r.width = 30;
  var left2 = r.left;
  var right2 = r.right;
  Expect.equals(left1, left2);
  Expect.notEquals(right1, right2);
}
