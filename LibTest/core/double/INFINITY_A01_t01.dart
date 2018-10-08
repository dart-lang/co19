/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double INFINITY
 * @description Checks that double.infinity equals 1 / 0.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


main() {
  Expect.equals(1/0, double.infinity);
  Expect.isTrue(double.infinity.isInfinite);
  Expect.isFalse(double.infinity.isNegative);
}
