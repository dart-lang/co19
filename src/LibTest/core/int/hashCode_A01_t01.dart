/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the primitive int value represented by this int object.
 * @description Checks that hash code returned is the same as the integer value
 *              represented by this object.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */

main() {
  Expect.equals(0, 0.hashCode);
  Expect.equals(2147483647, 2147483647.hashCode);
  Expect.equals(-2147483648, (-2147483648).hashCode);
  Expect.equals(4294967295, 4294967295.hashCode);
  Expect.equals(-4294967296, (-4294967296).hashCode);
  Expect.equals(9223372036854775807, 9223372036854775807.hashCode);
  Expect.equals(-9223372036854775808, (-9223372036854775808).hashCode);
}
