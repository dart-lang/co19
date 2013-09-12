/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double atan2(num a, num b)
 * Returns the angle between the positive x-axis and the vector ( [b], [a]).
 * @description Checks the result for standard angles.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {  
  Expect.equals(0.0, Math.atan2(0.0, 0.1));
  Expect.equals(0.0, Math.atan2(0.0, 10));
  Expect.equals(0.0, Math.atan2(0.0, double.INFINITY));
  Expect.equals(0.0, Math.atan2(1, double.INFINITY));
  Expect.equals(0.0, Math.atan2(0.0, 0.0));

  Expect.equals(-0.0, Math.atan2(-0.0, 10));
  Expect.equals(-0.0, Math.atan2(-0.0, 0.0));
  Expect.equals(-0.0, Math.atan2(-1, double.INFINITY));
  
  Expect.equals(Math.PI, Math.atan2(0.0, -0.1));
  Expect.equals(Math.PI, Math.atan2(0.0, -10));
  Expect.equals(Math.PI, Math.atan2(0.0, double.NEGATIVE_INFINITY));
  Expect.equals(Math.PI, Math.atan2(1, double.NEGATIVE_INFINITY));
  Expect.equals(Math.PI, Math.atan2(0.0, -0.0));

  Expect.equals(-Math.PI, Math.atan2(-0.0, -0.1));
  Expect.equals(-Math.PI, Math.atan2(-0.0, -0.0));
  Expect.equals(-Math.PI, Math.atan2(-1, double.NEGATIVE_INFINITY));
  
  Expect.equals(Math.PI/2, Math.atan2(0.1, 0.0));
  Expect.equals(Math.PI/2, Math.atan2(10, -0.0));
  Expect.equals(Math.PI/2, Math.atan2(double.INFINITY, 0.0));
  Expect.equals(Math.PI/2, Math.atan2(double.INFINITY, 0.0));
  Expect.equals(Math.PI/2, Math.atan2(double.INFINITY, -1));
  
  Expect.equals(-Math.PI/2, Math.atan2(-0.1, 0.0));
  Expect.equals(-Math.PI/2, Math.atan2(-0.1, -0.0));
  Expect.equals(-Math.PI/2, Math.atan2(-10, 0.0));
  Expect.equals(-Math.PI/2, Math.atan2(double.NEGATIVE_INFINITY, 0.0));
  Expect.equals(-Math.PI/2, Math.atan2(double.NEGATIVE_INFINITY, 1));
  Expect.equals(-Math.PI/2, Math.atan2(double.NEGATIVE_INFINITY, -100));
  
  Expect.equals(Math.PI/4, Math.atan2(double.INFINITY, double.INFINITY));
  
  Expect.equals(3*Math.PI/4, Math.atan2(double.INFINITY, double.NEGATIVE_INFINITY));
  
  Expect.equals(-Math.PI/4, Math.atan2(double.NEGATIVE_INFINITY, double.INFINITY));
  
  Expect.equals(-3*Math.PI/4, Math.atan2(double.NEGATIVE_INFINITY, double.NEGATIVE_INFINITY));
}
