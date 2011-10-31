/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the arc tangent of [a]/[b] with sign according to quadrant.
 * @description Checks result if one of arguments is NaN.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

main() {
  Expect.isTrue(Math.atan2(double.NAN, double.INFINITY).isNaN());
  Expect.isTrue(Math.atan2(double.NAN, double.NEGATIVE_INFINITY).isNaN());
  Expect.isTrue(Math.atan2(double.NAN, 1).isNaN());
  Expect.isTrue(Math.atan2(double.INFINITY, double.NAN).isNaN());
  Expect.isTrue(Math.atan2(double.NEGATIVE_INFINITY, double.NAN).isNaN());
  Expect.isTrue(Math.atan2(1, double.NAN).isNaN());
  Expect.isTrue(Math.atan2(double.NAN, double.NAN).isNaN());
}
