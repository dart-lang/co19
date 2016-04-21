/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Additive         +, -                              Left          13
 * @description Test that '+' additive operator has precedence (13).
 * Compare with Multiplicative (precedence 14). Test that '+' has
 * priority lower than '*'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(2 + (3 * 4), 2 + 3 * 4);
  Expect.notEquals((2 + 3) * 4, 2 + 3 * 4);
}
