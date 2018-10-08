/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int compareTo(Comparable other)
 * ...
 * Positive infinity is greater than any finite value (any value apart from
 * itself and NaN), and negative infinity is less than any other value.
 * @description Checks that Infinity is greater than any other value (but NaN)
 * and less than any other value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  List values = [
    0.0,
    double.maxFinite,
    2.2250738585072014e-308, // min normal
    4.9406564584124654e-324 // min
  ];

  values.forEach((val) {
    Expect.isTrue(double.infinity.compareTo(val) > 0);
    Expect.isTrue(val.compareTo(double.infinity) < 0);
  });
  Expect.isTrue(double.nan.compareTo(double.infinity) > 0);

  values.forEach((val) {
    Expect.isTrue(double.negativeInfinity.compareTo(-val) < 0);
    Expect.isTrue((-val).compareTo(double.negativeInfinity) > 0);
  });
  Expect.isTrue((-double.nan).compareTo(double.negativeInfinity) > 0);
}
