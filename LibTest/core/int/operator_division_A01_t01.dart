// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion double operator /(num other)
/// This operator implements the arithmetic division operation.
/// @description Checks that this operator returns correct value.
/// @author vasya

import "../../../Utils/expect.dart";
import "dart:math" as Math;

main() {
  Expect.equals(1.0,  1 / 1);
  Expect.equals(-1.0, 1 / -1);
  
  Expect.equals(0.5,  1 / 2);

  Expect.equals(0.0, 0 / 2);
  Expect.equals(0.0, 0 / 1);

  Expect.equals(-1.5, (-3) / 2);

  Expect.equals(1.0, 2147483647 / 2147483647);

  Expect.equals(4503599627370495.5, 9007199254740991 / 2);
  Expect.equals(-4503599627370495.5, 9007199254740991 / -2);
  Expect.equals(2.0, 9007199254740991 / 4503599627370495.5);
}
