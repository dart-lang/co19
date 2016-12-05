/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toUnsigned(int width)
 * Returns the least significant width bits of this integer as a non-negative
 * number (i.e. unsigned representation). The returned value has zeros in all
 * bit positions higher than width.
 *
 * (-1).toUnsigned(5) == 31   // 11111111  ->  00011111
 * ...
 * @description Checks that this method returns the least significant width bits
 * of this integer as a non-negative number
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(1, (-1).toUnsigned(1)); // 11111111 -> 00000001
  Expect.equals(3, (-1).toUnsigned(2)); // 11111111 -> 00000011
  Expect.equals(7, (-1).toUnsigned(3)); // 11111111 -> 00000111
  Expect.equals(15, (-1).toUnsigned(4)); // 11111111 -> 00001111
  Expect.equals(31, (-1).toUnsigned(5)); // 11111111 -> 00011111
  Expect.equals(63, (-1).toUnsigned(6)); // 11111111 -> 00111111
  Expect.equals(127, (-1).toUnsigned(7)); // 11111111 -> 01111111
  Expect.equals(255, (-1).toUnsigned(8)); // 11111111 -> 11111111
}
