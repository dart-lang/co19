/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Bitwise XOR      ˆ                                 Left          10
 * @description Test that '^' bitwise operator has precedence (10).
 * Compare with Bitwise OR operator (precedence 9). Test that '^' has
 * priority higher than '|'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(1 | (7 ^ 3) | 4, 1 | 7 ^ 3 | 4);
  Expect.notEquals((1 | 7) ^ (3 | 4), 1 | 7 ^ 3 | 4);
  Expect.notEquals(((1 | 7) ^ 3) | 4, 1 | 7 ^ 3 | 4);
  Expect.notEquals(1 | (7 ^ (3 | 4)), 1 | 7 ^ 3 | 4);
}
