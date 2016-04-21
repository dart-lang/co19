/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Relational        is                                 None           8
 * @description Test that 'is' relational operator has precedence (8).
 * Compare with Equality '==' operator (precedence 7). Test that 'is' has
 * priority higher than '=='
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  num a = 0;
  num b = 0;
  Expect.equals(a == (b is bool), a == b is bool);
  Expect.notEquals((a == b) is bool, a == b is bool);
}
