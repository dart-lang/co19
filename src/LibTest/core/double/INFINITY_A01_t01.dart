/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double INFINITY
 * @description Checks that double.INFINITY equals 1 / 0.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Expect.equals(1/0, double.INFINITY);
  Expect.isTrue(double.INFINITY.isInfinite());
  Expect.isFalse(double.INFINITY.isNegative());
}
