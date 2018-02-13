/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator %(num other)
 * Throws [Error] if [other] is [:null:].
 * @description Checks that the correct exception is thrown
 * @author msyabro
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";

final List<double> values = const [
   .0,
   4.9406564584124654e-324, // min
   2.2250738585072014e-308, // min normal
   1.7976931348623157e308, // max normal
   .7,
   .9999999999999999,
   1.0,
   1.0000000000000002,
   10.0,
   99.0,
   99.99999999999999,
   100.0,
   100.00000000000001,
   101.0,
   6031769.5,
   4.2949672959999995E9,
   4.294967296E9,
   4.294967296000001E9,
   4.5035996273704955E15,
   4.503599627370496E15,
   4.503599627370497E15,
   3.273390607896142E150,
   1/0,
   0/0
];

main()  {
  values.forEach((double val) {
    Expect.throws(() {val % null;}, (e) => e is Error);
  });
}
