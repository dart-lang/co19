/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion MutableRectangle.fromPoints(Point<T> a, Point<T> b)
 * Create a mutable rectangle spanned by the points a and b;
 * @description Checks that coordinate properties of the created object are
 * equal to the constructor arguments.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

const List<num> values = const [
   0, -1, 1, 10, -10, 100, -100, -1.7976931348623157e150, -3.273390607896142E15,
   -4.503599627370497E15, -4.503599627370496E15, -4.5035996273704955E15,
   -4.294967296000001E9, -4.294967296E9, -4.2949672959999995E9, -6031769.5,
   -101.0, -100.00000000000001, -100.0, -99.99999999999999, -99.0, -10.0,
   -1.0000000000000002, -1.0, -.9999999999999999, -.7, -2.2250738585072014e-150,
   -4.9406564584124654e-150, .0, 4.9406564584124654e-150,
   2.2250738585072014e-150, .7, .9999999999999999, 1.0, 1.0000000000000002,
   10.0, 99.0, 99.99999999999999, 100.0, 100.00000000000001, 101.0, 6031769.5,
   4.2949672959999995E9, 4.294967296E9, 4.294967296000001E9,
   4.5035996273704955E15, 4.503599627370496E15, 4.503599627370497E15,
   3.273390607896142E10, 1.7976931348623157e150
 ];
 
Random rand = new Random(123457);

num randomVal() {
  int k = rand.nextInt(values.length);
  return values[k];
}

void check(Point p1, Point p2) {
  MutableRectangle r = new MutableRectangle.fromPoints(p1, p2);
  Expect.equals(min(p1.x, p2.x), r.left);
  Expect.equals(min(p1.y, p2.y), r.top);
  Expect.equals((p2.x - p1.x).abs(), r.width);
  Expect.equals((p2.y - p1.y).abs(), r.height);
}

main() {
  for (int i = 0; i < 1000; i++) {
    num x = randomVal();
    num y = randomVal();
    num z = randomVal();
    num w = randomVal();
    check(new Point(x, y), new Point(z, w));
  }
}
