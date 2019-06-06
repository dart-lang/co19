/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks arithmetic operations via type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../Utils/expect.dart';

typedef IntAlias = int;
typedef NumAlias = num;
typedef DoubleAlias = double;

main() {
  const TOLERANCE = 0.00000000001;

  IntAlias i1 = 1;
  IntAlias i2 = 2;
  NumAlias n = 3.14;
  DoubleAlias d = 3.1415;

  Expect.equals(3, i1 + i2);
  Expect.approxEquals(4.14, n + i1, TOLERANCE);
  Expect.approxEquals(5.1415, d + i2, TOLERANCE);
  Expect.equals(6.283, d + d);
  Expect.equals(6.2815, d + n);
  Expect.equals(6.2815, n + d);

  Expect.equals(-1, i1 - i2);
  Expect.equals(2.14, n - i1);
  Expect.approxEquals(1.1415, d - i2, TOLERANCE);
  Expect.equals(0, d - d);
  Expect.approxEquals(0.0015, d - n, TOLERANCE);
  Expect.approxEquals(-0.0015, n - d, TOLERANCE);

  Expect.equals(2, i1 * i2);
  Expect.equals(4, i2 * i2);
  Expect.equals(6.28, n * i2);
  Expect.equals(6.283, d * i2);
  Expect.approxEquals(9.86902225, d * d, TOLERANCE);
  Expect.approxEquals(9.86431, d * n, TOLERANCE);
  Expect.approxEquals(9.86431, n * d, TOLERANCE);

  Expect.approxEquals(0.5, i1 / i2, TOLERANCE);
  Expect.approxEquals(1, i2 / i2, TOLERANCE);
  Expect.approxEquals(1.57, n / i2, TOLERANCE);
  Expect.approxEquals(1.57075, d / i2, TOLERANCE);
  Expect.approxEquals(1.0, d / d, TOLERANCE);
  Expect.approxEquals(1.0004777070063695, d / n, TOLERANCE);
  Expect.approxEquals(0.9995225210886519, n / d, TOLERANCE);
}
