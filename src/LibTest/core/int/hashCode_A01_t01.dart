/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that this getter returns a non-null value and throws no exceptions,
 * and that different int values have different hashcodes.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */

main() {
  Expect.isTrue(null != 0.hashCode);
  Expect.isTrue(null != 2147483647.hashCode);
  Expect.isTrue(null != (-2147483648).hashCode);
  Expect.isTrue(null != 4294967295.hashCode);
  Expect.isTrue(null != (-4294967296).hashCode);
  Expect.isTrue(null != 9223372036854775807.hashCode);
  Expect.isTrue(null != (-9223372036854775808).hashCode);
  
  Expect.notEquals((-2147483648).hashCode, 2147483648.hashCode);
  Expect.notEquals(1.hashCode, 0.hashCode);
}
