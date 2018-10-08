/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T squaredDistanceTo(Point<T> other)
 * Returns the squared distance between this and other.
 * Squared distances can be used for comparisons when the actual value is not
 * required.
 * @description Checks that squaredDistanceTo() roughly equals to the square of
 * distanceTo().
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

Random rand = new Random(817);

num randomVal() {
  int k = rand.nextInt(values.length);
  return values[k];
}

main() {
  for (int i = 0; i < 1000; i++) {
    Point point0 = new Point(randomVal(), randomVal());
    Point point1 = new Point(randomVal(), randomVal());
    num dist = point0.distanceTo(point1);
    num sdist = point0.squaredDistanceTo(point1);
    if (sdist < EPS) {
      Expect.approxEquals(dist * dist, sdist, EPS);
    } else {
      Expect.approxEquals(1, dist * dist / sdist, EPS);
    }
  }
}
