/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Bitwise AND      &                                 Left          11
 * @description Test that '&' bitwise operator has precedence (11).
 * Compare with Bitwise XOR operator (precedence 10). Test that '&' has
 * priority higher than '^'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(3 ^ (2 & 2) ^ 5, 3 ^ 2 & 2 ^ 5);
  Expect.notEquals((3 ^ 2) & (2 ^ 5), 3 ^ 2 & 2 ^ 5);
  Expect.notEquals(((3 ^ 2) & 2) ^ 5, 3 ^ 2 & 2 ^ 5);
  Expect.notEquals(3 ^ (2 & (2 ^ 5)), 3 ^ 2 & 2 ^ 5);
}
