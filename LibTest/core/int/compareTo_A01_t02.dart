/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int extends num and type num implements Comparable interface.
 * @description Checks that the compareTo method works with other number types
 * (double).
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(1,  1.compareTo(double.negativeInfinity));
  Expect.equals(1,  1.compareTo(-0.0));
  Expect.equals(1,  1.compareTo(0.0));
  Expect.equals(0,  1.compareTo(1.0));
  Expect.equals(-1, 1.compareTo(double.infinity));
  Expect.equals(-1, 1.compareTo(double.nan));
}
