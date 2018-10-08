/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double NEGATIVE_INFINITY
 * @description Checks that double.negativeInfinity equals -double.infinity.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(-double.infinity, double.negativeInfinity);
  Expect.isTrue(double.negativeInfinity.isInfinite);
  Expect.isTrue(double.negativeInfinity.isNegative);
}
