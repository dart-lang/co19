/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluates the trigonometric tangent of an angle.
 * @description Checks special values.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

import "dart:math" as Math;

main() {
  Expect.isTrue(Math.tan(double.NAN).isNaN());
  Expect.isTrue(Math.tan(double.INFINITY).isNaN());
  Expect.isTrue(Math.tan(double.NEGATIVE_INFINITY).isNaN());
}
