/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Bitwise Or      |                                 Left             9
 * @description Test that '|' bitwise operator has precedence (9).
 * Compare with Relational '>' operator (precedence 8). Test that '|' has
 * priority higher than '>'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(7 > (2 | 4), 7 > 2 | 4);
}
