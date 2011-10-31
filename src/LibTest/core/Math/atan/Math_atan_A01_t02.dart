/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the arc tangent of a value.
 * @description Checks special values.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

main() {
  Expect.isTrue(Math.atan(double.NAN).isNaN());
  Expect.isTrue(Math.atan(double.INFINITY) == Math.PI/2);
  Expect.isTrue(Math.atan(double.NEGATIVE_INFINITY) == -Math.PI/2);
}
