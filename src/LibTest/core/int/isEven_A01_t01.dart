/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if the number represented by this int object is even.
 * @description Checks that this method returns correct value.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(0.isEven);
  Expect.isFalse(1.isEven);
  Expect.isTrue(2.isEven);
  Expect.isTrue(2147483646.isEven);
  Expect.isFalse(2147483647.isEven);
  Expect.isTrue((-4294967296).isEven);
  Expect.isFalse((-4294967297).isEven);
  Expect.isTrue((-9223372036854775808).isEven);
  Expect.isFalse((-9223372036854775809).isEven);
 }
