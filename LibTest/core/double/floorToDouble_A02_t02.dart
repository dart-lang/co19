/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * abstract abstract double floorToDouble()
 * If this is not finite (NaN or infinity), returns this object unchanged.
 * @description Checks that [:floorToDouble():] called on a positive or negative
 * infinity returns this object unchanged.
 * @needsreview #16102
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(double.infinity.floorToDouble(), double.infinity);
  Expect.equals(double.negativeInfinity.floorToDouble(), double.negativeInfinity);
}
