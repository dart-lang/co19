/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double NEGATIVE_INFINITY
 * @description Checks that double.NEGATIVE_INFINITY equals -double.INFINITY.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Expect.equals(-double.INFINITY, double.NEGATIVE_INFINITY);
  Expect.isTrue(double.NEGATIVE_INFINITY.isInfinite());
  Expect.isTrue(double.NEGATIVE_INFINITY.isNegative());
}
