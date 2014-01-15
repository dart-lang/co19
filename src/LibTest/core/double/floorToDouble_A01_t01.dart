/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * abstract abstract double floorToDouble()
 * Returns the greatest integer value no greater than this.
 * The result is a double.
 * @description Checks that positive values less than one are rounded to zero.
 * @author kaigorodov
 */
import "dart:math" as Math;
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0.0, .1.floorToDouble());
  Expect.equals(0.0, .01.floorToDouble());
  Expect.equals(0.0, 1E-100.floorToDouble());
  Expect.equals(0.0, 4.9406564584124654e-324.floorToDouble()); // min subnormal
  Expect.equals(0.0, 2.2250738585072014e-308.floorToDouble()); // min normal
  Expect.equals(0.0, .5.floorToDouble());
  Expect.equals(0.0, .9.floorToDouble());
  Expect.equals(0.0, (1.0 - Math.pow(2.0, -53)).floorToDouble()); // max less than 1.0
}
