/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num remainder(num other)
 * Returns the remainder of the truncating division of this by other.
 *
 * The result r of this operation satisfies: this == (this ~/ other) * other + r.
 * As a consequence the remainder r has the same sign as the divider this.
 * @description Checks that this method returns correct value for integer
 * arguments.
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 1.remainder(1));
  Expect.equals(0, 1.remainder(1));
  Expect.equals(1, 1.remainder(2));
  Expect.equals(1, 3.remainder(2));
  Expect.equals(1, 3.remainder(-2));
  Expect.equals(-2, (-17).remainder(3));
  Expect.equals(-2, (-17).remainder(-3));

  Expect.equals(2147483647, 2147483647.remainder(2147483648));
  Expect.equals(0, 2147483647.remainder(2147483647));
  Expect.equals(1, 2147483647.remainder(2147483646));

  Expect.equals(9223372036854775806, 9223372036854775806.remainder(9223372036854775807));
  Expect.equals(0, 9223372036854775807.remainder(9223372036854775807));
  Expect.equals(1, 9223372036854775807.remainder(9223372036854775806));

  Expect.equals(-1844674407370955161, (-1844674407370955161).remainder(1844674407370955162));
  Expect.equals(0, (-1844674407370955161).remainder(1844674407370955161));
  Expect.equals(-1844674407370955161, (-1844674407370955161).remainder(1844674407370955162));
}
