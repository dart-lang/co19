/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract double ceilToDouble()
 * If this is not finite (NaN or infinity), returns this object unchanged.
 * @description Checks that [:ceilToDouble():] called on a positive or negative
 * infinity returns this object unchanged.
 * @needsreview #16102
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(double.INFINITY.ceilToDouble(), double.INFINITY);
  Expect.equals(double.NEGATIVE_INFINITY.ceilToDouble(), double.NEGATIVE_INFINITY);
}
