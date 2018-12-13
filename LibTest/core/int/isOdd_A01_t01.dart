/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if the number represented by this int object is odd.
 * @description Checks that this method returns correct value.
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isFalse(0.isOdd);
  Expect.isTrue(1.isOdd);
  Expect.isFalse(2.isOdd);
  Expect.isFalse(2147483646.isOdd);
  Expect.isTrue(2147483647.isOdd);
  Expect.isFalse((-4294967296).isOdd);
  Expect.isTrue((-4294967297).isOdd);
  Expect.isFalse((-9223372036854775808).isOdd);
  Expect.isTrue((-9223372036854775807).isOdd);
}
