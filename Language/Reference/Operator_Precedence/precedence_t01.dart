/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operator precedence is given implicitly by the grammar.
 * @description Checks that operator precedence given implicitly by the grammar
 * holds true (multiplicative operators have higher precedence than additive).
 * @author vasya
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals( (8 - 3) - 2, 8 - 3 - 2);
  Expect.equals( 5 + (3 * 2), 5 + 3 * 2);
  Expect.equals(((13 + (77 / 5.0)) - (16 * 17)) + (1 * 1),
      13 + 77 / 5.0 - 16 * 17 + 1 * 1);
  Expect.equals(((((1 + 2) + ((3 * 4) * 5)) + 6) + 7),
      1 + 2 + 3 * 4 * 5 + 6 + 7);
  Expect.equals(1 + ((2 * 2) * 4), 1 + 2 * 2 * 4);
  Expect.equals(((1 + 2) * 2) * 4, (1 + 2) * 2 * 4);
  Expect.equals((72 / 12) / 3, 72 / 12 / 3);
  Expect.equals(104 / 27, (31 + 73) / 27);
  Expect.equals(-(2) + 4, (1-3) + 4);
  Expect.equals(12 * 123, (17 - 5) * 123);
  Expect.equals(12 / -(2), 4 * 3 / -2);
}
