/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract double roundToDouble()
 * If this is not finite (NaN or infinity), returns this object unchanged.
 * @description Checks that [:roundToDouble():] on a positive or negative infinity
 * returns the same value.
 * @needsreview #16102
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(double.INFINITY.roundToDouble(), double.INFINITY);
  Expect.equals(double.NEGATIVE_INFINITY.roundToDouble(), double.NEGATIVE_INFINITY);
}
