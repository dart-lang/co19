/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract double roundToDouble()
 * If this is not finite (NaN or infinity), returns this object unchanged.
 * @description Checks that [:roundToDouble():] on NaN returns NaN.
 * @needsreview #16102
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  double nan =double.nan;
  Expect.isTrue(nan.roundToDouble().isNaN);
  Expect.isTrue((-nan).roundToDouble().isNaN);
}
