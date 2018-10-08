/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 * ...
 * It must return a boolean for all arguments. It should never throw or return
 * null.
 * @description Checks that it never throws or return null.
 * @needsreview #16170
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
  Rectangle r1 =
      new Rectangle(0, double.maxFinite, double.infinity, double.nan);
  for (int i = 0; i < values.length; i++) {
    for (int j = 0; j < values.length; j++) {
      for (int k = 0; k < values.length; k++) {
        for (int l = 0; l < values.length; l++) {
          Rectangle r2 =
              new Rectangle(values[i], values[j], values[k], values[l]);
          var res = (r1 == r2);
          Expect.isTrue(res is bool);
          Expect.isNotNull(res);
        }
      }
    }
  }
}
