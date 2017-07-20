/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T top
 * Setting the value will move the rectangle without changing its height.
 * @description Checks that setting the value will not change height of the
 * rectangle.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);
  Expect.equals(1, r.top);
  var height1 = r.height;
  r.top = -1;
  Expect.equals(-1, r.top);
  var height2 = r.height;
  Expect.equals(height1, height2);
}
