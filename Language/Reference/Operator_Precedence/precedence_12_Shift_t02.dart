/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Shift          <<, >>                            Left           12
 * @description Test that '>>' shift operator has precedence (12).
 * Compare with Bitwise AND operator (precedence 11). Test that '>>' has
 * priority higher than '&'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(2 & (8 >> 2) & 3, 2 & 8 >> 2 & 3);
  Expect.notEquals((2 & 8) >> (2 & 3), 2 & 8 >> 2 & 3);
  Expect.notEquals(((2 & 8) >> 2) & 3, 2 & 8 >> 2 & 3);
  Expect.notEquals(23 & (12 >> (2 & 1)), 23 & 12 >> 2 & 1);
}
