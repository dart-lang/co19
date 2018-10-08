/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * @description Checks that the string representation contains class name and
 * coordinates.
 * Coordinate values are not Inf or NaN.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  var str = new Point(0, 1).toString();
  Expect.isTrue(str is String);
  Expect.equals("Point(0, 1)", str);
}
