/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double atan2(num a, num b)
 * Returns the angle in radians between the positive x-axis and the vector
 * ([b], [a]).
 * @description Checks the result for standard angles.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {  
  Expect.equals(0.0, Math.atan2(0.0, 0.1));
  Expect.equals(0.0, Math.atan2(0.0, 10));
  Expect.equals(0.0, Math.atan2(0.0, double.infinity));
  Expect.equals(0.0, Math.atan2(1, double.infinity));
  Expect.equals(0.0, Math.atan2(0.0, 0.0));

  Expect.equals(-0.0, Math.atan2(-0.0, 10));
  Expect.equals(-0.0, Math.atan2(-0.0, 0.0));
  Expect.equals(-0.0, Math.atan2(-1, double.infinity));
  
  Expect.equals(Math.pi, Math.atan2(0.0, -0.1));
  Expect.equals(Math.pi, Math.atan2(0.0, -10));
  Expect.equals(Math.pi, Math.atan2(0.0, double.negativeInfinity));
  Expect.equals(Math.pi, Math.atan2(1, double.negativeInfinity));
  Expect.equals(Math.pi, Math.atan2(0.0, -0.0));

  Expect.equals(-Math.pi, Math.atan2(-0.0, -0.1));
  Expect.equals(-Math.pi, Math.atan2(-0.0, -0.0));
  Expect.equals(-Math.pi, Math.atan2(-1, double.negativeInfinity));
  
  Expect.equals(Math.pi / 2, Math.atan2(0.1, 0.0));
  Expect.equals(Math.pi / 2, Math.atan2(10, -0.0));
  Expect.equals(Math.pi / 2, Math.atan2(double.infinity, 0.0));
  Expect.equals(Math.pi / 2, Math.atan2(double.infinity, 0.0));
  Expect.equals(Math.pi / 2, Math.atan2(double.infinity, -1));
  
  Expect.equals(-Math.pi / 2, Math.atan2(-0.1, 0.0));
  Expect.equals(-Math.pi / 2, Math.atan2(-0.1, -0.0));
  Expect.equals(-Math.pi / 2, Math.atan2(-10, 0.0));
  Expect.equals(-Math.pi / 2, Math.atan2(double.negativeInfinity, 0.0));
  Expect.equals(-Math.pi / 2, Math.atan2(double.negativeInfinity, 1));
  Expect.equals(-Math.pi / 2, Math.atan2(double.negativeInfinity, -100));
  
  Expect.equals(Math.pi / 4, Math.atan2(double.infinity, double.infinity));
  
  Expect.equals(3 * Math.pi / 4, Math.atan2(
      double.infinity, double.negativeInfinity));
  
  Expect.equals(-Math.pi / 4, Math.atan2(
      double.negativeInfinity, double.infinity));
  
  Expect.equals(-3 * Math.pi / 4, Math.atan2(
      double.negativeInfinity, double.negativeInfinity));
}
