/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int modPow(int exponent, int modulus)
 * Returns this integer to the power of exponent modulo modulus.
 * The exponent must be non-negative and modulus must be positive.
 * @description Checks that the exponent must be non-negative and modulus must
 * be positive.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {3.modPow(-11, 4);}, (e) => e is RangeError);
  Expect.throws(() {3.modPow(11, -4);}, (e) => e is RangeError);
  Expect.throws(() {3.modPow(11, 0);}, (e) => e is RangeError);
}
