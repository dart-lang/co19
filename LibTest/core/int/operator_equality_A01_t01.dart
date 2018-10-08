/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(Object other)
 * Test whether this value is numerically equal to other.
 *
 * If both operands are doubles, they are equal if they have the same
 * representation, except that:
 *
 * - zero and minus zero (0.0 and -0.0) are considered equal. They both have the
 * numerical value zero.
 * - NaN is not equal to anything, including NaN. If either operand is NaN,
 * the result is always false.
 * If one operand is a double and the other is an int, they are equal if the
 * double has an integer value (finite with no fractional part) and
 * identical(doubleValue.toInt(), intValue) is true.
 *
 * If both operands are integers, they are equal if they have the same value.
 *
 * Returns false if other is not a num.
 *
 * Notice that the behavior for NaN is non-reflexive. This means that equality
 * of double values is not a proper equality relation, as is otherwise required
 * of operator==. Using NaN in, e.g., a HashSet will fail to work. The behavior
 * is the standard IEEE-754 equality of doubles.
 *
 * If you can avoid NaN values, the remaining doubles do have a proper equality
 * relation, and can be used safely.
 *
 * Use compareTo for a comparison that distinguishes zero and minus zero, and
 * that considers NaN values as equal.
 * @description Check that integer values are equal if they have the same value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(0 == 0);
  Expect.isTrue(2 == 2);
  Expect.isTrue(2147483648 == 2147483648);
  Expect.isTrue(-2147483647 == -2147483647);
  Expect.isTrue(4294967296 == 4294967296);
  Expect.isTrue(-4294967295 == -4294967295);
  Expect.isTrue(1844674407370955161 == 1844674407370955161);

  int x = 1;
  int y = 1;
  Expect.isTrue(x == y);
}
