/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num operator %(num other) 
 * The % operator yields the remainder of its operands from an implied division;
 * the left operand is the dividend and the right operand is the divisor.
 * @description Checks that this operator returns correct value for integer
 *              arguments (including 0).
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 1 % 1);
  Expect.equals(0, 0 % 1);

  Expect.equals(1, 1 % 2);

  Expect.equals(2, 17 % 3);
  Expect.equals(2, 17 % -3);
  Expect.equals(1, (-17) % 3);
  Expect.equals(1, (-17) % -3);

  Expect.equals(2147483647, 2147483647 % 2147483648);
  Expect.equals(0, 2147483647 % 2147483647);
  Expect.equals(1, 2147483647 % 2147483646);

  Expect.equals(1844674407370955161,
      1844674407370955161 % 1844674407370955162);
  Expect.equals(0, 1844674407370955161 % 1844674407370955161);
  Expect.equals(1, 1844674407370955162 % 1844674407370955161);

  Expect.equals(0, 0 % 1844674407370955161);
  Expect.equals(0, 0 % -1844674407370955161);
}
