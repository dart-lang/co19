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
 */


main() {
  double inf = 1 / 0;
  double negativeInf = -inf;
  Expect.isTrue(negativeInf.isNegative());
  Expect.isFalse((-negativeInf).isNegative());
  Expect.equals(inf, negativeInf.abs());
}
