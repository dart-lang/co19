/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operator precedence is given implicitly by the grammar.
 * @description Checks that operator precedence given implicitly by the grammar
 * holds true (additive > shift > bitwise AND > XOR > OR). 
 * @author vasya
 */
// SharedOptions=--enable-experiment=triple-shift

import "../../../Utils/expect.dart";

main() {
  Expect.equals(1024 >> (1 + 3), 1024 >> 1 + 3);
  Expect.equals((1 | (((4 + 16) << 3) & 7)), 1 | 4 + 16 << 2 & 7);
  Expect.equals((3 | (((4 + 1) >> 2) & 7)), 3 | 4 + 1 >> 2 & 7);
  Expect.equals((3 | (((4 + 1) >>> 2) & 7)), 3 | 4 + 1 >>> 2 & 7);
  Expect.equals((2 ^ 3) ^ 4, 2 ^ 3 ^ 4);
  Expect.equals((2 ^ 3) | 4, 2 ^ 3 | 4);
  Expect.equals(( 1 | 2 ) & 3, 1 | 2 & 3);
  Expect.equals(( 7 & 3 << 2 ) | ( 5 & ( 11 >> 1)), 7 & 3 << 2 | 5 & 11 >> 1);
}
