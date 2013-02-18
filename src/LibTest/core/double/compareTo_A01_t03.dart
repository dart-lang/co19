/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int compareTo(Comparable other)
 * @description Checks NaN as this value and as the argument.
 * @author pagolubev
 * @needsreview NaN assumed to be greater than infinity.
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


main() {
  double nan = 0 / 0;

  List values = [
    .0,
    1 / 0,
    1.7976931348623157e308, // max
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
