/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator /(num other)
 * @description Checks that if the actual result is greater than MAX_DOUBLE or
 * less than -MAX_DOUBLE the operator returns POSITIVE_INFINITY or
 * NEGATIVE_INFINITY
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(double.infinity, 1.7976931348623157e308 / 1e-10);
  Expect.equals(double.infinity, -1.7976931348623157e308 / (-1e-10));

  Expect.equals(double.negativeInfinity, -1.7976931348623157e308 / 0.01);
  Expect.equals(double.negativeInfinity, 1.7976931348623157e308 / (-0.01));
}
