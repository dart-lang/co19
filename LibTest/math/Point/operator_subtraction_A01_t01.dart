/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Point<T> operator -(Point<T> other)
 * Subtract other from this, as if both points were vectors.
 * Returns the resulting "vector" as a Point.
 * @description Checks that the returned value equals to the vector subtraction
 * of arguments.
 * Coordinate values are not Inf or NaN.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

const List<num> values = const [
   0, -1, 1, 10, -10, 100, -100,
   -1.7976931348623157e308, -3.273390607896142E150, -4.503599627370497E15,
   -4.503599627370496E15, -4.5035996273704955E15, -4.294967296000001E9,
   -4.294967296E9, -4.2949672959999995E9, -6031769.5,
   -101.0, -100.00000000000001, -100.0, -99.99999999999999, -99.0, -10.0,
   -1.0000000000000002, -1.0, -.9999999999999999, -.7, -2.2250738585072014e-308,
   -4.9406564584124654e-324, .0, 4.9406564584124654e-324,
   2.2250738585072014e-308, .7, .9999999999999999, 1.0, 1.0000000000000002,
   10.0, 99.0, 99.99999999999999, 100.0, 100.00000000000001, 101.0, 6031769.5,
   4.2949672959999995E9, 4.294967296E9, 4.294967296000001E9,
   4.5035996273704955E15, 4.503599627370496E15, 4.503599627370497E15,
   3.273390607896142E150, 1.7976931348623157e308
 ];
 
Random rand = new Random(370497);

num randomVal() {
  int k = rand.nextInt(values.length);
  return values[k];
}

main() {
  for (int i = 0; i < 1000; i++) {
    num x1 = randomVal();
    num x2 = randomVal();
    num y1 = randomVal();
    num y2= randomVal();
    Point point = new Point(x1, y1) - new Point(x2, y2);
    Expect.equals(x1 - x2, point.x, "x1=$x1, x2=$x2");
    Expect.equals(y1 - y2, point.y, "y1=$y1, y2=$y2");
  }
}
