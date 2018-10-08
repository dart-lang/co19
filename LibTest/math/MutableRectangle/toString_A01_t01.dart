/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * @description Checks that the returned string representation contains class
 * name and coordinates.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  var str = new MutableRectangle(0, 1, 1, 1).toString();
  Expect.isTrue(str is String);
  Expect.equals("Rectangle (0, 1) 1 x 1", str);
}
