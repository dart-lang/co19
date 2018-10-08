/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator +(num other)
 * @description Checks that if the actual result is greater than MAX_DOUBLE or
 * less than -MAX_DOUBLE operator returns POSITIVE_INFINITY or NEGATIVE_INFINITY
 * respectively.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(double.infinity, double.maxFinite + double.maxFinite);
  Expect.equals(double.negativeInfinity, -double.maxFinite +
      (-double.maxFinite));
}
