/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns x, rounded upwards to the nearest integer.
 * @description Checks that the method returns correct value. For integers, it
 * should be the same as input value.
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 0.ceil());
  Expect.equals(1, 1.ceil());
  Expect.equals(-1, (-1).ceil());
  Expect.equals(15, 15.ceil());
  Expect.equals(-15, (-15).ceil());
  Expect.equals(2147483647, 2147483647.ceil());
  Expect.equals(-4294967295, (-4294967295).ceil());
  Expect.equals(9223372036854775807, 9223372036854775807.ceil());
  Expect.equals(-1844674407370955161, (-1844674407370955161).ceil());
}
