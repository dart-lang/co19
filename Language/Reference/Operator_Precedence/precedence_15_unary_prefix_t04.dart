/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Unary prefix   -e, !e, ˜e, ++e, –e               None           15
 * @description Test that '++e' unary prefix operator has precedence (15).
 * Compare with Multiplicative operators (precedence 14). Test that '++e' has
 * priority higher than '*'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  int operator *(int b) {
    return b;
  }
}
main() {
  C c = new C();
  int e1 = 1;
  int e2 = 1;
  Expect.equals(c * (++e1), c * ++e2);
}
