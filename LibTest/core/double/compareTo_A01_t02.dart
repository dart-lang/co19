/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int compareTo(Comparable other)
 * @description Checks that [:compareTo:] returns a value less than 0 if 'this'
 * is less than the passed value and a value greater than 0 if 'this' is greater
 * than the passed value.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


main() {
  var values = [
        -1/.0, // -infinity
        -1.7976931348623157e308, // - max normal
        -6031769.5,
        -1.0,
        -.7,
        -2.2250738585072014e-308, // -min normal
        -2.2250738585072009e-308, // -max subnormal
        -4.9406564584124654e-324, // -min subnormal
        -.0,
        .0,
        4.9406564584124654e-324, // min subnormal
        2.2250738585072009e-308, // max subnormal
        2.2250738585072014e-308, // min normal
        .7,
        1.0,
        6031769.5,
        1.7976931348623157e308, // max normal
        1/.0, // infinity
        0/0
    ];

  for (int i = 0; i < values.length - 1; i++) {
    for (int j = i + 1; j < values.length; j++) {
      var a = values[i];
      var b = values[j];
      Expect.isTrue(a.compareTo(b) < 0, "Expected $a < $b" );
      Expect.isTrue(b.compareTo(a) > 0, "Expected $a > $b" );
    }
  }
}
