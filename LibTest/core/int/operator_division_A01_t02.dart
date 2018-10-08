/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator /(num other)
 * This operator implements the arithmetic division operation.
 * @description Checks that division by zero yields correct results (infinities
 * and NaN).
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(double.infinity, 1 / 0);
  Expect.equals(double.negativeInfinity, -2 / 0);
  
  Expect.isTrue((0 / 0).isNaN);
}

