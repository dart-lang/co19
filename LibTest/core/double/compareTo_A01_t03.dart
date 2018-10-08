/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int compareTo(Comparable other)
 * ...
 * For ordering, the double NaN value is considered equal to itself, and greater
 * than any numeric value
 * @description Checks that NaN is greater than any other value
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


main() {
  double nan = double.nan;

  List values = [
    0.0,
    double.infinity,
    double.maxFinite,
    2.2250738585072014e-308, // min normal
    4.9406564584124654e-324 // min
  ];

  values.forEach((val) {
    Expect.isTrue(nan.compareTo(val) > 0);
    Expect.isTrue(val.compareTo(nan) < 0);
  });

  Expect.equals(nan.compareTo(nan), 0);
  Expect.equals(nan.compareTo(-nan), 0);
}
