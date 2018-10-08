/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * A Point is only equal to another Point with the same coordinates.
 * This point is equal to other if, and only if, other is a Point with x equal
 * to other.x and y equal to other.y.
 * @description Checks that the equality operator is symmetric.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

const List<num> values = const [
   0, -1, 1, 10, -10,
   0.0, -1.0, 1.0, 10.0, -10.0,
   double.infinity, double.maxFinite, double.minPositive, -double.maxFinite,
   -double.minPositive, double.nan, double.negativeInfinity
 ];
 
main() {
  for (int i = 0; i < values.length; i++) {
    for (int j = 0; j < values.length; j++) {
      for (int k = 0; k < values.length; k++) {
        for (int l = 0; l < values.length; l++) {
          Point point1 = new Point(values[i], values[j]);
          Point point2 = new Point(values[k], values[l]);
          var res1 = (point1 == point2);
          var res2 = (point2 == point1);
          var res = (res1 == res2);
          Expect.isTrue(res);
          Expect.isNotNull(res);
        }
      }
    }
  }
}
