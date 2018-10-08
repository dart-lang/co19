/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void height=(T height)
 * Setting the value will change the bottom edge of the rectangle, but will not
 * change top.
 * @description Checks that setting the value will change the bottom edge of the
 * rectangle, but will not change top.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);
  var top1 = r.top;
  var bottom1 = r.bottom;
  r.height = 11;
  var top2 = r.top;
  var bottom2 = r.bottom;
  Expect.equals(top1, top2);
  Expect.notEquals(bottom1, bottom2);
}
