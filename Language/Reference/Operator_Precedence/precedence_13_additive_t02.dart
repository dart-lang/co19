/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Additive         +, -                              Left          13
 * @description Test that '-' additive operator has precedence (13).
 * Compare with Shift operators (precedence 12). Test that '-' has
 * priority higher than '<<'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals((4 - 2) << (3 - 1), 4 - 2 << 3 - 1);
  Expect.notEquals(4 - (2 << 3) - 1, 4 - 2 << 3 - 1);
  Expect.notEquals(((4 - 2) << 3) - 1, 4 - 2 << 3 - 1);
  Expect.notEquals(4 - (2 << (3 - 1)), 4 - 2 << 3 - 1);
}
