// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion double toDouble()
/// Returns the double value represented by this object.
/// @description Checks that this method returns correct value (rounded to the
/// nearest finite double for very large integers).
/// @author vasya

import "../../../Utils/expect.dart";
import "dart:math" as Math;

main() {
  final double MIN_DOUBLE = Math.pow(2.0, -1074) as double;
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE =
      (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023) as double;
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  check(0, 0.0);
  check(2147483647, 2147483647.0);
  check(-2147483648, -2147483648.0);
  check(4294967295, 4294967295.0);
  check(-4294967296, -4294967296.0);
  check(9007199254740991, 9007199254740991.0);
  check(-9007199254740991, -9007199254740991.0);
}

void check(int x, double ex) {
  Expect.equals(ex, x.toDouble());
}
