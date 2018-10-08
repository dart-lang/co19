/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 * ...
 * Reflexive: For all objects o, o == o must be true.
 * @description Checks that the equality operator is reflexive if coordinates of
 * a MutableRectangle are not double.NaN.
 * @author ngl@unipru.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

const List<num> values = const [
  0, -1, 1, 10, -10, 0.0, -1.0, 1.0, 10.0, -10.0,
  double.infinity, double.maxFinite, double.minPositive, -double.maxFinite,
  -double.minPositive, double.negativeInfinity
];
 
main() {
  for (int i = 0; i < values.length; i++) {
    for (int j = 0; j < values.length; j++) {
      for (int k = 0; k < values.length; k++) {
        for (int l = 0; l < values.length; l++) {
          MutableRectangle r =
              new MutableRectangle(values[i], values[j], values[k], values[l]);
          if ((r.right.isNaN || r.bottom.isNaN)) {
            Expect.isFalse(r == r, "${r.left} ${r.top} ${r.right} ${r.bottom}");
          } else {
            Expect.isTrue(r == r, "${r.left} ${r.top} ${r.right} ${r.bottom}");
          }
        }
      }
    }
  }
}
