/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operator precedence is given implicitly by the grammar.
 * @description Checks that operator precedence given implicitly by the grammar
 * holds true (logical AND higher than logical OR and logical negation higher
 * than both).
 * @author vasya
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

check(bool A, bool B, bool C, [bool D=true]) {
  Expect.equals(A || (B && C), A || B && C);
  Expect.equals((A && B) || (C && D), A && B || C && D);
  Expect.equals(((A && B) && C) || D, A && B && C || D);
  Expect.equals(((!A) && B) || C, !A && B || C);
}

main() {
  check(true, true, true);
  check(true, true, true, false);
  check(true, true, false, false);
  check(true, false, false, false);
  check(false, false, false, false);
  check(false, false, false);
  check(false, false, true);
  check(false, true, true);
}
