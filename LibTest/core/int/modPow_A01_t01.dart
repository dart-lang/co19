/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int modPow(int exponent, int modulus)
 * Returns this integer to the power of exponent modulo modulus.
 * The exponent must be non-negative and modulus must be positive.
 * @description Checks that this method returns  this integer to the power of
 * exponent modulo modulus.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(1, 4.modPow(2, 5));
  Expect.equals(9, 3.modPow(6, 20));
}
