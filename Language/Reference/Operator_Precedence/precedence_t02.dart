/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operator precedence is given implicitly by the grammar.
 * @description Checks that operator precedence given implicitly by the grammar
 * holds true (multiplicative operators have higher precedence than additive
 * and unary expressions have even higher).
 * @author vasya
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals((5 * 8) % 9, 5 * 8 % 9);
  Expect.equals((5 % 8) * 9, 5 % 8 * 9);
  Expect.equals((4 * 11) + ((-5) * 3), 4 * 11 + -5 * 3);
  Expect.equals((-7) + 99 - (6 * 74), -7 + 99 - 6 * 74);
  Expect.equals(((~(-3)) * 2) + 5, ~-3 * 2 + 5);
  Expect.equals((((10 * 5) + (100 / 10)) - 5 + (7 % 2)),
      10 * 5 + 100 / 10 - 5 + 7 % 2);
}
