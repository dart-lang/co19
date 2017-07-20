/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double distanceTo(Point<T> other)
 * Returns the distance between this and other.
 * @description Checks that the returned value equals to the Euclidean distance.
 * Coordinate values are not Inf or NaN.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

const List<num> values = const [
   0, -1, 1, 10, -10, 100, -100,
   -1.7976931348623157e150, -3.273390607896142E15, -4.503599627370497E15,
   -4.503599627370496E15, -4.5035996273704955E15, -4.294967296000001E9,
   -4.294967296E9, -4.2949672959999995E9, -6031769.5, -101.0,
   -100.00000000000001, -100.0, -99.99999999999999, -99.0, -10.0,
   -1.0000000000000002, -1.0, -.9999999999999999, -.7, -2.2250738585072014e-150,
   -4.9406564584124654e-150, .0, 4.9406564584124654e-150,
   2.2250738585072014e-150, .7, .9999999999999999, 1.0, 1.0000000000000002,
   10.0, 99.0, 99.99999999999999, 100.0, 100.00000000000001, 101.0, 6031769.5,
   4.2949672959999995E9, 4.294967296E9, 4.294967296000001E9,
   4.5035996273704955E15, 4.503599627370496E15, 4.503599627370497E15,
   3.273390607896142E10, 1.7976931348623157e150
 ];
 
const EPS = 1.0e-10;

Random rand = new Random(962737962737);

num randomVal() {
  int k = rand.nextInt(values.length);
  return values[k];
}

void check(num x1, num y1, num x2, num y2) {
  Point point1 = new Point(x1, y1);
  Point point2 = new Point(x2, y2);
  double dist = (point1 - point2).magnitude;
  Expect.equals(
      dist, point1.distanceTo(point2), "x1=$x1, y1=$y1, x2=$x2, y2=$y2");
}

main() {
  for (int i = 0; i < 1000; i++) {
    num x1 = randomVal();
    num x2 = randomVal();
    num y1 = randomVal();
    num y2 = randomVal();
    check(x1, y1, x2, y2);
  }
}
