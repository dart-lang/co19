/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator negate()
 * @description Checks [:negate():] on a infinity.
 * @author pagolubev
 * @reviewer msyabro
 * @needsreview issue 3283
 */


main() {
  double inf = double.INFINITY;
  double negativeInf = inf.negate();
  Expect.isTrue(negativeInf.isNegative());
  Expect.isFalse((-negativeInf).isNegative());
  Expect.equals(inf, negativeInf.abs());
}
