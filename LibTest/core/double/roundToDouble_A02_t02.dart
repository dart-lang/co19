/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract double roundToDouble()
 * If this is not finite (NaN or infinity), returns this object unchanged.
 * @description Checks that [:roundToDouble():] on a positive or negative
 * infinity returns the same value.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(double.infinity.roundToDouble(), double.infinity);
  Expect.equals(double.negativeInfinity.roundToDouble(),
      double.negativeInfinity);
}
