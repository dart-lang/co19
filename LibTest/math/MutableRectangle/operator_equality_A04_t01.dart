/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 * ...
 * Symmetric: For all objects o1 and o2, o1 == o2 and o2 == o1 must either both
 * be true, or both be false.
 * @description Checks that the equality operator is symmetric.
 * @needsreview #16170
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

const List<num> values = const [
  0, -1, 1, 10, -10, 0.0, -1.0, 1.0, 10.0, -10.0,
  double.infinity, double.maxFinite, double.minPositive, -double.maxFinite,
  -double.minPositive, double.nan, double.negativeInfinity
];
 
main() {
  for (int i = 0; i < values.length; i++) {
    for (int j = 0; j < values.length; j++) {
      for (int k = 0; k < values.length; k++) {
        for (int l = 0; l < values.length; l++) {
          MutableRectangle r1 =
              new MutableRectangle(values[i], values[j], values[k], values[l]);
          MutableRectangle r2 =
              new MutableRectangle(values[k], values[l], values[i], values[j]);
          var res1 = (r1 == r2);
          var res2 = (r2 == r1);
          var res = (res1 == res2);
          Expect.isTrue(res);
          Expect.isNotNull(res);
        }
      }
    }
  }
}
